package com.kh.khis.interview_management.interview.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.interview_management.common.IRManagementUtils;
import com.kh.khis.interview_management.interview.model.service.InterviewService;
import com.kh.khis.interview_management.interview.model.vo.Interview;
import com.kh.khis.interview_management.irinfo.model.vo.IRInfo;
import com.kh.khis.login_join_mypage.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/interview")
@Slf4j
public class InterviewController {
	
	@Autowired
	private InterviewService interviewService;
	
	@GetMapping("/interviewList.do")
	public String interviewList(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttr) {
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		Member member = (Member) session.getAttribute("loginMember"); 
		if(member == null) {
 			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
 			return "redirect:/member/loginForm.do";
		}else {
			Long co_code = member.getCoCode();
			List<Interview> list = interviewService.selectInterviewList(offset, limit, co_code);
			model.addAttribute("list", list);
			
			int totalContent = interviewService.selectInterviewTotalCount(co_code);
			
			String url = request.getRequestURI(); // /khis/interview/interviewList.do
			String pagebar = IRManagementUtils.getPagebar(cPage, limit, totalContent,url);		
			
			model.addAttribute("pagebar", pagebar);
			return "/interview_management/interview/interviewList";	
		}
	}
	
	@GetMapping("/insertInterview.do")
	public String insertInterview(Model model, HttpSession session, RedirectAttributes redirectAttr) {
		// 질문 등록 가능한 면접자 리스트 불러오기 : 세션의 #loginMember에서 회원번호로 불러오기
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
 			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
 			return "redirect:/member/loginForm.do";
		}else {
			// 1. 로그인 회원 회원번호
//			int memberNo = member.getMemberNo();
			log.debug("loginMember = {}", member);
			long coCode = member.getCoCode();
			List<IRInfo> list = interviewService.selectInterviewerList(coCode);
			log.debug("list = {}", list);
			model.addAttribute("list", list);
			return "interview_management/interview/insertInterview";
		}
	}
	
	@PostMapping("/insertInterview.do")
	public String insertInterview(Interview interview, HttpServletRequest request, RedirectAttributes redirectAttr) {
		log.debug("interview = {}", interview);
		int result = interviewService.insertInterview(interview);
		String msg = result > 0 ? "등록 성공" : "등록 실패";
		redirectAttr.addFlashAttribute("msg", msg);
		return "redirect:/interview/interviewList.do";
	}
	
	@GetMapping("/detailInterview.do")
	public String detailInterview(@RequestParam int interviewNo, Model model, HttpSession session, RedirectAttributes redirectAttr) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
 			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
 			return "redirect:/member/loginForm.do";
		}else {
			int memberNo = member.getMemberNo();
			log.debug("interviewNo = {}", interviewNo);
			
			List<IRInfo> list = interviewService.selectInterviewerList(memberNo);
			log.debug("list = {}", list);
			model.addAttribute("list", list);
			
			Interview interview = interviewService.selectOneInterview(interviewNo);
			log.debug("interview = {}", interview);
			model.addAttribute("interview", interview);
			
			return "/interview_management/interview/detailInterview";
		}
	}
	
	
	@GetMapping("/updateInterview.do")
	public String updateInterview(@RequestParam int interviewNo, Model model, HttpSession session, RedirectAttributes redirectAttr) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
 			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
 			return "redirect:/member/loginForm.do";
		}else {
			int memberNo = member.getMemberNo();
			log.debug("interviewNo = {}", interviewNo);
			List<IRInfo> list = interviewService.selectInterviewerList(memberNo);
			log.debug("lis {}", list);
			model.addAttribute("list", list);
			Interview interview = interviewService.selectOneInterview(interviewNo);
			log.debug("interview = {}", interview);
			model.addAttribute("interview", interview);
			return "/interview_management/interview/updateInterview";
		}
	}
	
	@PostMapping("/updateInterview.do")
	public String updateInterview(Interview interview, RedirectAttributes redirectAttr) {
		log.debug("interview = {}", interview);
		int result = interviewService.updateInterview(interview);
		log.debug("result = {}", result);
		String msg = result > 0 ? "수정 성공" : "수정 실패";
		redirectAttr.addFlashAttribute("msg", msg);
		return "redirect:/interview/interviewList.do";
	}
	
	@PostMapping("/deleteInterview.do")
	public String deleteInterview(@RequestParam int interviewNo, RedirectAttributes redirectAttr) {
		int result = interviewService.deleteInterview(interviewNo);
		log.debug("result = {}", result);
		String msg = result > 0 ? "삭제 성공" : "삭제 실패";
		redirectAttr.addFlashAttribute("msg", msg);
		return "redirect:/interview/interviewList.do";
	}
}

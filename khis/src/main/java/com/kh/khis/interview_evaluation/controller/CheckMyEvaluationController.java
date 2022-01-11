package com.kh.khis.interview_evaluation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.interview_evaluation.model.service.CheckMyEvaluationService;
import com.kh.khis.interview_evaluation.model.vo.Detail;
import com.kh.khis.interview_evaluation.model.vo.Results;
import com.kh.khis.login_join_mypage.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/info")
public class CheckMyEvaluationController {
	
	@Autowired
	private CheckMyEvaluationService checkMyEvaluationService;
	
	@GetMapping("/checkMyEvaluation.do")
	public String CheckMyEvaluation(Model model, HttpSession session, RedirectAttributes redirectAttr) {
		
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
 			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
 			return "redirect:/member/loginForm.do";
		}else {
			int member_no = member.getMemberNo();// 나중에 세션에서 가져와야함
			String name = member.getName();
			String premium = member.getEndYN();
			System.out.println("premium = {} " + premium);
			List<Results> results = checkMyEvaluationService.selectResults(member_no);
			model.addAttribute("list", results);
			model.addAttribute("name", name);
			model.addAttribute("premium", premium);
			System.out.println("list = " + results);
			
			return "interview_evaluation/CheckMyEvaluation";	
		}
	}
	
	@PostMapping("/checkDetail.do")
	public String CheckDetail(@RequestParam String passcheck, Model model, HttpSession session, RedirectAttributes redirectAttr) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
 			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
 			return "redirect:/member/loginForm.do";
		}else {
			int member_info_no = member.getMemberInfoNo();
			List<Detail> detail = checkMyEvaluationService.selectInfoDetail(member_info_no);
			Map<Integer, List<Detail>> param = new HashMap<>();
			for(Detail details : detail) {
				List<Detail> detail2 = param.get(details.getMember_info_no()) == null ? new ArrayList() : param.get(details.getMember_info_no());
				detail2.add(details);
				param.put(details.getMember_info_no(), detail2);
			}
			System.out.println(param);
			model.addAttribute("passcheck", passcheck);
			model.addAttribute("detailList", param);
			return "interview_evaluation/Detail";
		}
	}

}

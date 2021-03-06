package com.kh.khis.interview_evaluation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.interview_evaluation.common.HiSpringUtils2;
import com.kh.khis.interview_evaluation.model.service.EvaluationService;
import com.kh.khis.interview_evaluation.model.vo.Apply;
import com.kh.khis.interview_evaluation.model.vo.Assigned;
import com.kh.khis.interview_evaluation.model.vo.Career;
import com.kh.khis.interview_evaluation.model.vo.Certificate;
import com.kh.khis.interview_evaluation.model.vo.Evaluation;
import com.kh.khis.interview_evaluation.model.vo.Interviewer;
import com.kh.khis.interview_evaluation.model.vo.Interviews;
import com.kh.khis.interview_evaluation.model.vo.PassOrNonPass;
import com.kh.khis.interview_evaluation.model.vo.PassYN;
import com.kh.khis.login_join_mypage.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/evaluation")
public class EvaluationController {
	
	@Autowired
	private EvaluationService evaluationService;
	
	@GetMapping("/evaluation.do")
	public String EvaluationList(
			@RequestParam(defaultValue = "1") int cPage,
			Model model, 
			HttpServletRequest request,
			HttpSession session,
			RedirectAttributes redirectAttr
		) {
		
		int limit = 3;
		int offset = (cPage - 1) * limit;
		Member member = (Member) session.getAttribute("loginMember");
		/*if(member.getKind().equals("IR_SUPERVISOR")) {*/
		if(member == null) {
			redirectAttr.addFlashAttribute("loginMsg", "????????? ??? ?????????????????????.");
			return "redirect:/";
		}
		else {
			// 1. ?????? ????????? ??????
			System.out.println("member = " + member);
			if(member.getMemberInfoNo() == null) {
				redirectAttr.addFlashAttribute("evmsg", "???????????? ?????? ???????????????.");
				return "redirect:/member/irSMyPage.do";
			}
			else {
				int assigned_interviewer = member.getMemberInfoNo();
				List<Interviewer> list = evaluationService.selectMemberList(offset, limit, assigned_interviewer);
				if(list == null) {
					redirectAttr.addFlashAttribute("msg", "????????? ???????????? ????????????.");
					return "redirect:/member/irSMyPage.do";
				}
				else {
				log.debug("list = {}", list);
				model.addAttribute("list", list);
	//			System.out.println("list1 = " + list.get(0));
	//			model.addAttribute("list1", list.get(0)); 
				
				// 2. ?????? ????????? ???
				int totalCount = evaluationService.selectMemberCount(assigned_interviewer);
				int notcomeCount = 0;
				log.debug("totalCount = {}", totalCount);
				model.addAttribute("totalCount", totalCount);
				for(Interviewer i : list) {
					notcomeCount += (i.getMember_no() == 0 ? 1 : 0);
				}
				model.addAttribute("notcomeCount", notcomeCount);
				// 3. pagebar
				String url = request.getRequestURI();
				String pagebar = HiSpringUtils2.getPagebar(cPage, limit, totalCount, url);
				log.debug("pagebar = {}", pagebar);
				model.addAttribute("pagebar", pagebar);
				/* } */
				/*
				 * else if (member == null){ String msg = "????????? ??? ??????????????????.";
				 * request.setAttribute("loginmsg", msg); }
				 */
				System.out.println("loginMember = " + assigned_interviewer);
				return "interview_evaluation/Evaluation";
				}
			}
		}
	}
	
	@ResponseBody
	@GetMapping("/evaluationDetail.do")
	public Map<String, Object> memberDetail(@RequestParam int member_no) {
		
		// 1. ????????? ??? ??? ??????
		Interviewer interviewer = evaluationService.selectOneMember(member_no);
		log.debug("interviewer = {}", interviewer);
		Map<String, Object> param = new HashMap<>();
		param.put("interviewer", interviewer);
		int interviewer_info_no = interviewer.getInterviewer_info_no();
		
		System.out.println("interviewer_info_no = " + interviewer_info_no);
		
		List<Certificate> certificate = evaluationService.selectOneCertificate(interviewer_info_no);
		log.debug("certificate = {}", certificate);
		param.put("certificate", certificate);
		
		List<Career> career = evaluationService.selectCareerList(interviewer_info_no);
		log.debug("career = {}", career);
		param.put("career", career);
		
		return param;
	}
	
	@ResponseBody
	@GetMapping("/evaluationQuestion.do")
	public List<Interviews> question(
			@RequestParam String member_info_no,
			HttpSession session,
			RedirectAttributes redirectAttr
			){
		Member member = (Member) session.getAttribute("loginMember");
		int member_info_no2 = member.getMemberInfoNo(); // ?????? ???????????? ????????? ?????? ???????????????
//		int member_info_no2 = 43;
		Map<String, Object> param = new HashMap<>();
		param.put("imember_info_no", member_info_no);
		param.put("member_info_no", member_info_no2);
		List<Interviews> questionList = evaluationService.selectQuestionList(param);
		param.put("questionList", questionList);
		List<Interviews> evaluationList = evaluationService.selectEvaluationList(param);
		param.put("evaluationList", evaluationList);
		
		List<Interviews> finalList = new ArrayList<>();
		log.debug("questionList = {}", questionList);
		System.out.println("questionList = " + questionList);
		System.out.println("evaluationList = " + evaluationList);
		// ????????? ???????????? ?????? ????????? ??????????????? null ????????? ????????? ???
		for(int i = 0; i < questionList.size(); i++) {
			Interviews is = new Interviews(); // title, evaluate_value evaluate_comment, passcheck
			is.setTitle(questionList.get(i).getTitle());
			is.setInterview_no(questionList.get(i).getInterview_no());
			if(!evaluationList.isEmpty()) {
				//if(evaluationList.size()) 
				// ?????? 3??? ??????, ????????? ?????? ????????? ?????? -> OK
				// ?????? 3??? ??????, ?????? 1?????? ???????????? ?????? ????????? ?????? 2,3 ???????????? ??????
				// ?????? 3??? ??????, ?????? 2?????? ???????????? ?????? ????????? list??? ???????????? 1?????????????????? ???????????? ?????????
				for(int ii = 0; ii < evaluationList.size(); ii++) {
					if(evaluationList.get(ii).getInterview_no() == questionList.get(i).getInterview_no()) {
						is.setEvaluate_value(evaluationList.get(ii).getEvaluate_value());
						is.setEvaluate_comment(evaluationList.get(ii).getEvaluate_comment());
						is.setPasscheck(evaluationList.get(ii).getPasscheck());
						is.setEvaluate_no(evaluationList.get(ii).getEvaluate_no());
					}
				}
			}

			finalList.add(is);
		}
		
		return finalList;
	}
	
	@PostMapping("/insertEvaluation.do")
	public String insertEvaluation(
			@RequestParam String interview_no,
			@RequestParam String evaluate_value,
			@RequestParam String evaluate_comment,
			RedirectAttributes redirectAttr,
			HttpSession session,
			Model model) {
		Member member = (Member) session.getAttribute("loginMember");
		String member_info_no = Integer.toString(member.getMemberInfoNo()); // ????????? ???????????? ??????????????? (????????? ??????)
		Evaluation evaluation = new Evaluation(
				0,
				Integer.parseInt(interview_no), 
				Integer.parseInt(member_info_no),
				Integer.parseInt(evaluate_value),
				evaluate_comment);
		System.out.println("interview-no = " + interview_no);
		log.debug("evaluation = {}", evaluation);
		
		int result = evaluationService.insertEvaluation(evaluation);
		log.debug("result = {}", result);
		
		String msg = result > 0 ? "????????? ?????????????????????." : "????????? ??????????????????.";
		
		Map<String, Object> param = new HashMap<>();
		param.put("interview_no", interview_no);
		param.put("member_info_no", member_info_no);
		if(result > 0) {
			int evaluate_no = evaluationService.selectEvaluateNo(param);
			model.addAttribute("evaluate_no", evaluate_no);
			System.out.println("evaluate_no ========== " + evaluate_no);
		}
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/evaluation/evaluation.do";
	}
	
	@PostMapping("/updateEvaluation.do")
	public String updateEvaluation(
			@RequestParam String interview_no,
			@RequestParam String member_no,
			@RequestParam String evaluate_value,
			@RequestParam String evaluate_comment,
			RedirectAttributes redirectAttr	
		) {
		Evaluation evaluation = new Evaluation(
				100,
				Integer.parseInt(interview_no), 
				Integer.parseInt(member_no),
				Integer.parseInt(evaluate_value),
				evaluate_comment);
		log.debug("evaluation = {}", evaluation);
		
		int result = evaluationService.updateEvaluation(evaluation);
		log.debug("result = {}", result);
		
		String msg = result > 0 ? "????????? ?????????????????????." : "????????? ??????????????????.";
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/evaluation/evaluation.do";
		
	}
	
	@ResponseBody
	@GetMapping("/pastApply.do")
	public List<Apply> pastApply(
			@RequestParam long co_code,
			@RequestParam int member_info_no
		){
		List<Apply> list = new ArrayList();
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("co_code", co_code);
			param.put("member_info_no", member_info_no);
			list = evaluationService.selectApplyList(param);
			log.debug("list = {}", list);
			
			System.out.println("list = " + list);
			
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@ResponseBody
	@GetMapping("/interviewerList.do")
	public List<Assigned> selectAssignedList(
			@RequestParam int member_info_no,
			HttpSession session
		){
		Member member = (Member) session.getAttribute("loginMember");
		int assigned_interviewer = member.getMemberInfoNo(); // ???????????? ??????????????? ????????? ??????
		Map<String, Integer> param = new HashMap<>();
		param.put("member_info_no", member_info_no);
		param.put("assigned_interviewer", assigned_interviewer);
		List<Assigned> list = evaluationService.selectAssignedList(param);
		log.debug("list = {}", list);
		
		return list;
	}
	
	
//	@ResponseBody
//	@GetMapping("/otherInterviewerEvaluation.do")
//	public List<Evaluation> othereInterviewerEvaluation(
//			@RequestParam int member_no
//		){
//		Map<String, Integer> param = new HashMap<>();
//		param.put("member_no", member_no);
//		List<Evaluation> list = evaluationService.selectOtherInterviewerEvaluation(param);
//		log.debug("list = {}", list);
//		
//		return list;
//	}
	
	@ResponseBody
	@GetMapping("/otherInterviewerEvaluation.do")
	public List<Interviews> othereInterviewerEvaluation(
			@RequestParam String imember_info_no
		){
		List<Interviews> list = evaluationService.selectOtherInterviewerEvaluation(imember_info_no);
		log.debug("list = {}", list);
		
		return list;
	}
	
	@ResponseBody
	@GetMapping("/sumValue.do")
	public int sumValue(
			@RequestParam String interview_no,
			HttpSession session
		) {
		Member member = (Member) session.getAttribute("loginMember");
		int member_info_no = member.getMemberInfoNo(); // ?????? session?????? ????????? ?????? ???????????????
		Map<String, Object> param = new HashMap<>();
		List<Integer> evaluate_no_list = new ArrayList<Integer>();
		for(String a : interview_no.split(",")) // ,??? split ??? ??? ?????? ??? list??? ??????
			evaluate_no_list.add(Integer.parseInt(a));
		System.out.println("zzzzzzzzzzz=" + evaluate_no_list);
		param.put("member_info_no", member_info_no);
		param.put("evaluate_no", evaluate_no_list);
		int sum = evaluationService.calculateSumValue(param);
		log.debug("result = {}", sum);
		System.out.println("------------------------evaluate_no = " + interview_no);
		return sum;
	}
	
	@ResponseBody
	@PostMapping("/passnonpass.do")
	public String passnonpass(PassOrNonPass pass, HttpSession session, RedirectAttributes redirectAttr) {
		Member member = (Member) session.getAttribute("loginMember");
		pass.setImember_info_no(member.getMemberInfoNo()); // ?????? ???????????? ????????? ?????? ?????????
		pass.setComment_no(1111);
		log.debug("pass = {}", pass);
		int result = evaluationService.passnonpass(pass);
		log.debug("result = {}", result);
		System.out.println(pass.getPasscheck());
		
		return "redirect:/evaluation/evaluation.do";
	}
	
	@GetMapping("/finalEvaluation.do")
	private String MemberInfoList(
			@RequestParam(defaultValue = "1") int cPage,
			Model model, 
			HttpServletRequest request,
			HttpSession session,
		    RedirectAttributes redirectAttr
			) {
		Member member = (Member) session.getAttribute("loginMember");
		/*if(member.getKind().equals("IR_SUPERVISOR")) {*/
		if(member == null) {
			redirectAttr.addFlashAttribute("loginMsg", "????????? ??? ?????????????????????.");
			return "redirect:/";
		}
		else {		
			int limit = 3;
			int offset = (cPage - 1) * limit;
			
			long co_code = member.getCoCode(); // ?????? ?????? ?????? ???????????????.
			
			// 1. co_code ??? ????????? ??????
			List<Interviewer> list = evaluationService.selectInterviewerList(limit, offset, co_code);
			log.debug("InterviewerList = {}", list);
			model.addAttribute("iList", list);
			
			// 2. ??? ????????? ???
			int iTotalCount = evaluationService.selectInterviewerCount(co_code);
			log.debug("iTotalCount = {}", iTotalCount);
			model.addAttribute("iTotalCount", iTotalCount);
			
			
			// 3. page_bar
			String url = request.getRequestURI();
			String pagebar = HiSpringUtils2.getPagebar(cPage, limit, iTotalCount, url);
			log.debug("pagebar = {}", pagebar);
			model.addAttribute("pagebar", pagebar);
			
			return "interview_evaluation/FinalCheck"; 
		}
	}
	
	@ResponseBody
	@GetMapping("/InterviewrDetail.do")
	public List<Assigned> InterviewerDetail(
			@RequestParam int member_info_no,
			HttpSession session
			){
		Member member = (Member) session.getAttribute("loginMember");
		long co_code = member.getCoCode(); // ?????? ?????? ?????? ???????????????.
		Map<String, Object> param = new HashMap<>();
		param.put("co_code", co_code);
		param.put("member_info_no", member_info_no);
		
		List<Assigned> assigendList = evaluationService.selectInterviewerDetail(param);
		
		
		return assigendList;
	}
	
	@ResponseBody
	@PostMapping("insertFinalEvaluation.do")
	public String insertPassYn(PassYN pass, RedirectAttributes redirectAttr) {
		log.debug("pass = {}", pass);
		pass.setCo_code(1);
		pass.setBoard_write_yn("n");
		int result = evaluationService.insertPassYn(pass);
		return "redirect:/evaluation/FinalCheck.do";
	}


}

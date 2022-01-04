package com.kh.khis.login_join_mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.khis.login_join_mypage.model.dto.JoinFormDto;
import com.kh.khis.login_join_mypage.model.service.MemberService;
import com.kh.khis.login_join_mypage.model.vo.Member;

//import com.kh.khis.login_join_mypage.model.service.MemberService;
//import com.kh.khis.login_join_mypage.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

/**
 * Read 담당
 */
@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping("/loginForm.do") //회원가입 페이지를 확인을 해야하니까 getMapping 을 해준거고
	public String loginForm(Model model, HttpSession session) {
		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		model.addAttribute("msg", msg);
		return "login_join_mypage/loginForm";
	}


	@GetMapping("/joinForm.do") //회원가입 페이지를 확인을 해야하니까 getMapping 을 해준거고
	public String joinForm() {

		return "login_join_mypage/joinForm";
	}


	@GetMapping("/irMyPage.do")
	public String irMyPage(Model model, HttpSession session) {
		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		model.addAttribute("msg", msg);
		return "login_join_mypage/irMyPage";
	}

	@GetMapping("/userMyPage.do")
	public String userMyPage(Model model, HttpSession session) {
		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		model.addAttribute("msg", msg);
		return "login_join_mypage/userMyPage";
	}

	@GetMapping("/irSMyPage.do")
	public String irSMyPage(Model model, HttpSession session) {
		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		model.addAttribute("msg", msg);
		return "login_join_mypage/irSMyPage";
	}

	@GetMapping("/irHMyPage.do")
	public String irHMyPage(Model model, HttpSession session) {
		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		model.addAttribute("msg", msg);
		return "login_join_mypage/irHMyPage";
	}


	@GetMapping("/updateForm.do")
	public String updateForm(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", member);
		return "login_join_mypage/updateForm";
	}

	@GetMapping("/companyNo.do")
	public String compnayNo() {

		return "login_join_mypage/companyNo";
	}


	@GetMapping("/aggrement.do")
	public String aggrement() {

		return "login_join_mypage/aggrement";
	}

	@GetMapping("/kind.do")
	public String kind() {

		return "login_join_mypage/kind";
	}

	@GetMapping("/irSKind.do")
	public String irSKind() {

		return "login_join_mypage/irSKind";
	}

	@GetMapping("/findIdForm.do")
	public String findIdFormd() {

		return "login_join_mypage/findIdForm";
	}

	@GetMapping("/findPasswordForm.do")
	public String findPasswordForm() {

		return "login_join_mypage/findPasswordForm";
	}

	@GetMapping("/adminMyPage.do")
	public String adminMyPage() {
		return "login_join_mypage/adminMyPage";
	}
	/*
	 * @GetMapping("/adminMemberList.do") public String adminMemberList(Model model,
	 * HttpSession session) { List<JoinFormDto> userList=
	 * memberService.selectMemberList(null); model.addAttribute("userList",
	 * userList); return "login_join_mypage/adminMemberList"; }
	 */

	@GetMapping("/schedule.do")
	public String schedule() {
		return "login_join_mypage/schedule";
	}

}


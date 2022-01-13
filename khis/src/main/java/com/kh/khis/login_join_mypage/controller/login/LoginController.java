package com.kh.khis.login_join_mypage.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.login_join_mypage.model.service.MemberCompanyService;
import com.kh.khis.login_join_mypage.model.service.MemberService;
import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.login_join_mypage.model.vo.MemberCompany;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberCompanyService memberCompanyService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@PostMapping("/loginmember")
	public String memberLogin(
			@RequestParam String id,
			@RequestParam String password,
			RedirectAttributes redirectAttr,
			Model model,
			HttpSession session) {
		session.setAttribute("admin", false);
		log.debug("id = {}, password = {}", id, password);
		log.debug("{}", passwordEncoder.encode(password));

		// 1.업무로직 - 사용자데이터가져오기
		Member member = memberService.selectOneMember(id);
		log.debug("member = {}", member);

		String location = "/";
		// 2.db정보 비교하기(로그인 성공여부 판단)
		if(member != null && passwordEncoder.matches(password, member.getPassword())) {
			// 로그인 성공 : loginMember객체를 세션에 저장해서 로그인상태유지
			model.addAttribute("loginMember", member);
			session.setAttribute("loginMember", member);
			System.out.println("loginMember" + member);
			if(member.getKind().equals("IR_HAED")){
				MemberCompany memberCompany = memberCompanyService.selectOneMemberCompany(member.getCoCode().toString());
				session.setAttribute("memberCompany", memberCompany);
			}
			// redirect주소 세션에서 가져오기
			String redirect = (String) session.getAttribute("redirect");
			log.debug("redirect = {}", redirect);
			if(redirect != null) {
				location = redirect;
				session.removeAttribute("redirect");
				return "redirect:/";
			} /*
				 * else { switch (member.getKind()) { case "IR": location =
				 * "/member/irMyPage.do"; break; case "USER": location =
				 * "/member/userMyPage.do"; break; case "IR_SUPERVISOR": location =
				 * "/member/irSMyPage.do"; break; case "IR_HAED": location =
				 * "/member/irHMyPage.do"; break; case "ADMIN": location =
				 * "/member/adminMyPage.do"; break; }
				 *
				 * }
				 */
		}
		else {
			// 로그인 실패
			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 다릅니다.");
			location = "/member/loginForm.do";
		}

		return "redirect:" + location;
	}

	/**
	 * @SessionAttributes를 통해 로그인상태관리
	 * -> sessionStatus객체를 통해 사용완료처리(setComplete)
	 *
	 * @return
	 */
	@GetMapping("/logout.do")
	public String memberLogout(SessionStatus sessionStatus, HttpSession session) {
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();

		session.removeAttribute("loginMember");
		return "redirect:/";
	}
}

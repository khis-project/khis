package com.kh.khis.login_join_mypage.controller.admin;

import javax.servlet.http.HttpServletRequest;
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

import com.kh.khis.login_join_mypage.model.service.EmailAuthCodeService;
import com.kh.khis.login_join_mypage.model.service.MemberService;
import com.kh.khis.login_join_mypage.model.vo.EmailAuthCode;
import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.login_join_mypage.util.EmailService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class ManagementController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private EmailService emailService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private EmailAuthCodeService emailAuthCodeService;

	@PostMapping("/findId.do")
	public String findId(@RequestParam String phone, @RequestParam String email, RedirectAttributes redirectAttr,
			Model model, HttpSession session, HttpServletRequest request) {
		String location = "/";
		// 1.업무로직 - 사용자데이터가져오기
		Member member = new Member();
		member.setPhone(phone);
		member.setEmail(email);
		Member oneMember = memberService.findMemberByPhoneAndEmail(member);
		if (oneMember == null) {
			log.debug("계정을 찾지 못했습니다.");
			redirectAttr.addFlashAttribute("msg", "계정을 찾지 못했습니다.");
			location = "/member/findIdForm.do";
		} else {
			log.debug("member = {}", oneMember);

			// 1. 이메일로 메일 내용을 보내준다.
			emailService.simpleMailSend(oneMember.getEmail(), "[khis] 요청하신 아이디 입니다.",
					"당신의 아이디는 " + oneMember.getId() + " 입니다.");

			// 2. 로그인 폼으로 리다이렉트 해준다.
			request.getSession().setAttribute("msg", "이메일로 아이디를 발송 하였습니다.");
			location = "/member/loginForm.do";
		}
		return "redirect:" + location;
	}

	// 이메일 전송 코드
	@PostMapping("/requestEmailAuthCode")
	public String requestEmailAuthCode(@RequestParam String id, @RequestParam String email,
			RedirectAttributes redirectAttr, Model model, HttpSession session) {
		// 1.업무로직 - 사용자데이터가져오기
		EmailAuthCode emailAuthCode = new EmailAuthCode();
		emailAuthCode.setMemberId(id);
		emailAuthCode.setEmail(email);
		return "";
	}

	// 비밀번호 변경
	@PostMapping("/changePassword")
	public String changePassword(@RequestParam String id, @RequestParam String email, @RequestParam int authCode,
			@RequestParam String newPassword, @RequestParam String confirmPassword, RedirectAttributes redirectAttr,
			Model model, HttpSession session) {
		String location = "/";

		// 1. 인증코드와 아이디 이메일이 부합하는 데이터가 있는지 검증부터 해야함.
		// 2. 검증이 무사히 잘 되면 새로운 패스워드를 주입해줌 -> 이 때 스프링 패스워드 인코더를 이용(회원가입 참고)
		// 3. 아니라면 인증코드가 틀렸습니다. 반환
		EmailAuthCode emailAuthCode = new EmailAuthCode();
		emailAuthCode.setMemberId(id);
		emailAuthCode.setEmail(email);
		emailAuthCode.setAuthCode(authCode);
		System.out.println("데이터 들어오는지 테스트");
		EmailAuthCode e = emailAuthCodeService.findEmailAuthCodeByIdAndEmailAndAuthCode(emailAuthCode);
		if (e == null) {
			redirectAttr.addFlashAttribute("msg", "인증코드가 틀립니다.");
			System.out.println("인증 코드 틀림");
			return location = "/member/loginForm.do";
		}

		if (!newPassword.equals(confirmPassword)) {
			redirectAttr.addFlashAttribute("msg", "비밀번호를 같게 입력해주세요.");
			System.out.println("비밀번호 틀림");
			location = "login_join_mypage/loginForm";
		}

		String encryptedPassword = passwordEncoder.encode(newPassword);
		Member paramMember = new Member();
		paramMember.setId(id);
		paramMember.setEmail(email);
		Member member = memberService.findMemberByIdAndEmail(paramMember);
		System.out.println("멤버가 담김 -> member의 이메일 :: " + member.getEmail());

		member.setPassword(encryptedPassword);
		System.out.println("멤버가 담김 -> member의 패스워드 :: " + member.getPassword());
		int result = memberService.updateMember(member);
		System.out.println("resulr 값 -> :: " + result);
		location = "login_join_mypage/loginForm";
		// redirect는 URL로 보내줌
		return location;
	}

	//로그아웃
	@GetMapping("/logout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		if (!sessionStatus.isComplete())
			sessionStatus.setComplete();

		return "redirect:/";
	}
}


package com.kh.khis.login_join_mypage.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.kh.khis.login_join_mypage.common.MvcUtils;
import com.kh.khis.login_join_mypage.model.dto.JoinFormDto;
import com.kh.khis.login_join_mypage.model.service.MemberCompanyService;
import com.kh.khis.login_join_mypage.model.service.MemberService;
import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.login_join_mypage.model.vo.MemberCompany;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberCompanyService memberCompanyService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private RestTemplate restTemplate;


  @GetMapping("/adminMemberList.do") public String getMemberList(Model model, HttpServletRequest request, HttpSession session,
		 @RequestParam(defaultValue = "1") int page) {
	  Integer count = 10;
	  RowBounds params = new RowBounds(count * (page - 1), count);
	  List<JoinFormDto> userList = memberService.selectMemberList(params);
	  // userList = new ArrayList<>(userList.subList((page - 1) * count, page * count));
	  model.addAttribute("userList", userList);
	  // session.setAttribute("admin", true);

	  int totalContents = userList.size();
	  String url = request.getContextPath() + "admin/adminMemberList.do?page=";
	  String pageBar = MvcUtils.getPagebar(page, count, totalContents, url);
	  model.addAttribute("pageBar", pageBar);
	  model.addAttribute("pageIndex", page);
	  model.addAttribute("memberCount", memberService.countMember(0));

	  session.setAttribute("admin", true);
	  return "login_join_mypage/adminMemberList";
  }

	/*
	 * @GetMapping("/memberList.do") public String getMemberList(Model model,
	 * HttpSession session) { List<JoinFormDto> userList=
	 * memberService.selectMemberList(null); model.addAttribute("userList",
	 * userList); return "login_join_mypage/adminMemberList"; }
	 */


	@GetMapping("/updateThisUser.do/{userId}")
	public String updateThisUser(@PathVariable("userId") String userId, Model model, HttpSession session) {
		Member member = memberService.selectOneMember(userId);
		if (member.getKind().equals("IR_HAED")) {
			MemberCompany memberCompany = memberCompanyService.selectOneMemberCompany(member.getCoCode().toString());
			model.addAttribute("memberCompany", memberCompany);
		}
		model.addAttribute("loginMember", member);
		return "login_join_mypage/updateForm";
	}

	@GetMapping("/deleteThisUser.do/{userId}")
	public String deleteThisUser(@PathVariable("userId") String userId, Model model, HttpSession session) {
		Member member = memberService.selectOneMember(userId);
		if (member != null) {
			memberService.deleteOneMember(member.getId());
		}
		List<JoinFormDto> userList = memberService.selectMemberList(null);
		model.addAttribute("userList", userList);
		return "login_join_mypage/adminMemberList";
	}

}

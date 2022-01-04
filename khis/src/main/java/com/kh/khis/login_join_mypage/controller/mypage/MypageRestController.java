package com.kh.khis.login_join_mypage.controller.mypage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.khis.login_join_mypage.model.service.MemberService;
import com.kh.khis.login_join_mypage.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MypageRestController {

	@Autowired
	private MemberService memberService;

	/**
	 * ResponseEntity
	 * 응답처리를 커스터마이징
	 *  - 헤더값 작성
	 *  - 응답 코드
	 *  - 메세지 바디 작성
	 *
	 *  @ResponseBody 생략가능(이미 포함된 기능)
	 *
	 * 1. ResponseEntity생성자호출
	 * @param id
	 * @return
	 */
	@GetMapping("/selectOneMember.do")
	public ResponseEntity<Member> selectOne(@RequestParam String id) {
		try {
			Member member = memberService.selectOneMember(id);
			log.debug("member = {}", member);

			HttpHeaders header = new HttpHeaders();
			header.add("khacademy", "m-class");

			if(member != null)
				return new ResponseEntity<Member>(member, header, HttpStatus.OK);
			else
				return new ResponseEntity<Member>(HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			return new ResponseEntity<Member>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * 2. ResponseEntity를 builder패턴 생성하기
	 * - builder패턴 : static메소드를 연속적으로 호출해서 field값을 설정하는 객체생성법
	 *
	 * @param id
	 * @return
	 */
	@GetMapping("/one/{id}")
	public ResponseEntity<?> member(@PathVariable String id){
		try {
			log.debug("id = {}", id);
			Member member = memberService.selectOneMember(id);
			HttpHeaders header = new HttpHeaders();
			header.add("khacademy", "m-class");
			if(member != null)
				return ResponseEntity.ok().headers(header).body(member);
			else
				return ResponseEntity.notFound().build();
		} catch (Exception e) {
//			return ResponseEntity.interServerError().build(); // 5.3.8
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	@GetMapping("/scheduleList.do")
	public ResponseEntity<?> scheduleList(HttpSession session) {
		try {
			Member member = (Member) session.getAttribute("loginMember");
			List<Map<String, Object>> list = memberService.selectScheduleList(member);
			return ResponseEntity.ok().body(list);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	/*
	 * @GetMapping("/selectMemberList.do") public ResponseEntity<?>
	 * memberList(@RequestParam(required = false) String gender){ Map<String,
	 * Object> param = new HashMap<>(); param.put("gender", gender); if(gender !=
	 * null && !("M".equals(gender) || "F".equals(gender))) return ResponseEntity
	 * .badRequest() .body("wrong gender value : " + gender);
	 *
	 * List<Member> list = memberService.selectMemberList(param);
	 * log.debug("list = {}", list); return ResponseEntity.ok(list); }
	 */

}

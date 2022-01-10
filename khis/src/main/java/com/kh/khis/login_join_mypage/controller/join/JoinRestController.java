package com.kh.khis.login_join_mypage.controller.join;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.login_join_mypage.model.dto.JoinFormDto;
import com.kh.khis.login_join_mypage.model.service.MemberCompanyService;
import com.kh.khis.login_join_mypage.model.service.MemberService;
import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.login_join_mypage.model.vo.MemberCompany;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

@RestController
@Slf4j
@RequestMapping("/join")
public class JoinRestController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberCompanyService memberCompanyService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private RestTemplate restTemplate;

	@PostMapping(value = "/companyNo", produces = "application/json;charset=utf-8")
	public String companyNo(@RequestParam String coCode) {

//	      // url 메소드 파라미터 셋팅
		JSONObject obj = new JSONObject();
//	      params.put("start_dt", "20000101");
//	      params.put("p_nm", "홍길동");
//	      params.put("p_nm2", "홍길동");
//	      params.put("b_nm", "(주)테스트");
//	      params.put("corp_no", companyNo);
		obj.put("b_no", new Object[] { coCode.replace("-", "") });

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> request = new HttpEntity<String>(obj.toString(), headers);

		try {
			String response = restTemplate.postForObject(
					"https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=i76FJjXF6WY3xYL2ZzM%2BHYWFoWcZgNJQZfCnDjvv89wqpprxL2sJvB%2FCJIM2QeL2Jc4idqkhRZ3CDervYFmO6Q%3D%3D", request,
					String.class);

			return response;
		} catch (HttpStatusCodeException e) {
			log.error(e.getLocalizedMessage());
			log.error(e.getResponseBodyAsString());
			return "false";
		}
	}


	// 회원가입 및 비밀번호 암호화 처리
	@PostMapping("/joinForm.do")
	public void memberjoin(JoinFormDto joinFormDto, RedirectAttributes redirectAttr, HttpServletRequest request, HttpServletResponse response) throws IOException {

		log.debug("joinFormDto = {}", joinFormDto);

		/**
		 * IR_HAED : interviewerNo를 제외한 나머지
		 * IR_SUPERVISOR , USER : coCode, CoName, interviewerNo를 제외한 나머지
		 * IR : coCode, CoName를 제외한 나머지
		 */
		try {
			log.info("{}", passwordEncoder);
			Member member = new Member();
			member.setJoinDate(joinFormDto.getJoinDate());
			member.setName(joinFormDto.getName());
			member.setBirthday(joinFormDto.getBirthday());
			member.setEmail(joinFormDto.getEmail());
			member.setPhone(joinFormDto.getPhone());
			member.setAddress(joinFormDto.getAddress());
			member.setGender(joinFormDto.getGender());
			member.setKind(joinFormDto.getKind());
			member.setId(joinFormDto.getId());

			if(joinFormDto.getKind().equals("IR")) {
				member.setInterviewerNo(joinFormDto.getInterviewerNo());
				member.setCoCode(joinFormDto.getCoCode());
			}

			if(joinFormDto.getKind().equals("IR_SUPERVISOR")) {
				member.setCoCode(joinFormDto.getCoCode());
			}

			if(joinFormDto.getKind().equals("IR_HAED")) {
				member.setCoCode(joinFormDto.getCoCode());
				memberCompanyService.insertMemberCompany(new MemberCompany((joinFormDto.getCoCode()), joinFormDto.getCoName(), joinFormDto.getCoAddress()));
			}

            String rawPassword = joinFormDto.getPassword();
            String encryptedPassword = passwordEncoder.encode(rawPassword);
            member.setPassword(encryptedPassword);


            log.info("{} -> {}", rawPassword, encryptedPassword);
            log.info("{} ::", member.getCoCode());

            // 1.업무로직
            int result = memberService.insertMember(member);

            // 2.리다이렉트 & 사용자피드백전달
            System.out.println("result" + result);
            if(result > 0) {
            	 request.getSession().setAttribute("msg", "회원가입이 완료되었습니다.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        response.sendRedirect(request.getContextPath() + "/member/loginForm.do");
    }



	// 회원정보 업데이트
	@PostMapping("/memberUpdate.do")
	public void memberUpdate(JoinFormDto joinFormDto, RedirectAttributes redirectAttr, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
			Member member = new Member();
			member.setName(joinFormDto.getName());
			member.setEmail(joinFormDto.getEmail());
			member.setPhone(joinFormDto.getPhone());
			member.setAddress(joinFormDto.getAddress());
			member.setGender(joinFormDto.getGender());
			member.setKind(joinFormDto.getKind());
			member.setId(joinFormDto.getId());
			member.setInterviewerNo(joinFormDto.getInterviewerNo());

		try {
			if(joinFormDto.getKind().equals("IR")) {
				member.setInterviewerNo(joinFormDto.getInterviewerNo());
				member.setCoCode(joinFormDto.getCoCode());
			}

			if(joinFormDto.getKind().equals("IR_SUPERVISOR")) {
				member.setCoCode(joinFormDto.getCoCode());
			}


			if(joinFormDto.getKind().equals("IR_HAED")) {
				member.setCoCode(joinFormDto.getCoCode());
				//memberCompanyService.insertMemberCompany(new MemberCompany((joinFormDto.getCoCode()), joinFormDto.getCoName()));
				// memberCompanyService.insertMemberCompany(new MemberCompany((joinFormDto.getCoCode()), joinFormDto.getCoName(), joinFormDto.getCoAddress()));

			}
			//1.비지니스로직 실행
			int result = memberService.updateMember(member);

			//2.처리결과에 따라 view단 분기처리
			System.out.println("result" + result);
			if(result > 0){
				request.getSession().setAttribute("msg", "회원 정보를 수정했습니다.");
			}

			} catch(Exception e) {
				log.error("회원 정보 수정 실패", e);
				e.printStackTrace();
				throw e; // spring container에게 예외상황 알림
			}
		session.setAttribute("loginMember", member);
		if(member.getKind().equals("IR_HAED")){

			MemberCompany memberCompany = memberCompanyService.selectOneMemberCompany(member.getCoCode().toString());
			memberCompany.setCoAddress(joinFormDto.getCoAddress());
			memberCompany.setCoName(joinFormDto.getCoName());
			memberCompanyService.updateMemberCompany(memberCompany);
			session.setAttribute("memberCompany", memberCompany);
		}

		if(session.getAttribute("admin") != null && (boolean) session.getAttribute("admin") == false) {
			switch (joinFormDto.getKind()) {
			case "IR":
				response.sendRedirect(request.getContextPath() + "/member/irMyPage.do");
				break;
			case "USER":
				response.sendRedirect(request.getContextPath() + "/member/userMyPage.do");
				break;
			case "IR_SUPERVISOR":
				response.sendRedirect(request.getContextPath() + "/member/irSMyPage.do");
				break;
			case "IR_HAED":
				response.sendRedirect(request.getContextPath() + "/member/irHMyPage.do");
				break;
			}
		}
		else {
			response.sendRedirect(request.getContextPath() + "/admin/adminMemberList.do");
		}


		}

	// 회원 탈퇴
	@DeleteMapping("/memberDelete.do")
	@ResponseBody
	public Map<String, Object> memberUpdate(HttpServletRequest request) throws IOException {
		Member member = (Member) request.getSession().getAttribute("loginMember");
		int affected = memberService.deleteOneMember(member.getId());

		Map<String, Object> map = new HashMap<>();
		boolean success = affected > 0; //영향 받은(삭제된) 열이 0개 이상이면 success: true
		map.put("success", success);
		return map;
	}


	@ResponseBody
	@GetMapping("/checkIdDuplicate2.do")
	public Map<String, Object> idCheckDuplicate2(@RequestParam String id){
		Map<String, Object> map = new HashMap<>();

		Member member = memberService.selectOneMember(id);
		map.put("available", member == null);
		map.put("abc", 123);
		map.put("today", new Date());

		return map;
	}

	@ResponseBody
	@GetMapping("/irSKind")
	public Map<String, Object> irSKind(@RequestParam Map<String, Object> params) {
		Map<String, Object> map = new HashMap<>();

		String birthday = (String) params.get("birthday");
		boolean success;
		if (birthday.length() != 6) {
			success = false;
		} else {
			Member member = memberService.findInfo(params);
			success = member != null;
		}
		map.put("success", success);
		return map;
	}

	@ResponseBody
	@GetMapping("/kind")
	public Map<String, Object> kind(@RequestParam Map<String, Object> params){
		Map<String, Object> map = new HashMap<>();
		String birthday = (String) params.get("birthday");
		boolean success;
		if (birthday.length() != 6) {
			success = false;
		} else {
			Member member = memberService.findInfo(params);
			success = member != null;
			if (success) {
				map.put("coCode", member.getCoCode());
			}
		}
		map.put("success", success);
		return map;
	}

	@GetMapping("/selectOneMember.do")
	public ResponseEntity<Member> selectOne(@RequestParam String id) {
		try {
			Member member = memberService.selectOneMember(id);
			log.debug("member = {}", member);

			HttpHeaders header = new HttpHeaders();
			header.add("khacademy", "m-class");

			if (member != null)
				return new ResponseEntity<Member>(member, header, HttpStatus.OK);
			else
				return new ResponseEntity<Member>(HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			return new ResponseEntity<Member>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * 2. ResponseEntity를 builder패턴 생성하기 - builder패턴 : static메소드를 연속적으로 호출해서 field값을
	 * 설정하는 객체생성법
	 *
	 * @param id
	 * @return
	 */
	@GetMapping("/one/{id}")
	public ResponseEntity<?> member(@PathVariable String id) {
		try {
			log.debug("id = {}", id);
			Member member = memberService.selectOneMember(id);
			HttpHeaders header = new HttpHeaders();
			header.add("khacademy", "m-class");
			if (member != null)
				return ResponseEntity.ok().headers(header).body(member);
			else
				return ResponseEntity.notFound().build();
		} catch (Exception e) {
//			return ResponseEntity.interServerError().build(); // 5.3.8
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	/*
	 * @GetMapping("/selectMemberList.do") public ResponseEntity<?>
	 * memberList(@RequestParam(required = false) String gender) { Map<String,
	 * Object> param = new HashMap<>(); param.put("gender", gender); if (gender !=
	 * null && !("M".equals(gender) || "F".equals(gender))) return
	 * ResponseEntity.badRequest().body("wrong gender value : " + gender);
	 *
	 * List<Member> list = memberService.selectMemberList(param);
	 * log.debug("list = {}", list); return ResponseEntity.ok(list); }
	 */

	@ExceptionHandler
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public void handle(Exception e) {
	    log.warn("Returning HTTP 400 Bad Request", e);
	}
}





package com.kh.khis.untact_interview_statistics_practice.interview_practice.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.untact_interview_statistics_practice.common.HiSpringUtils;
import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.service.InterviewPracticeService;
import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

@Slf4j
@Controller
@RequestMapping("/interviewPractice")
public class InterviewPracticeController{
	
	@Autowired
	private InterviewPracticeService interviewPracticeService;
	
	/**
	 * @Autowired 
	 * - 타입일치 빈
	 * - 이름과 일치하는 빈
	 */
//	@Autowired
//	private InterviewPracticeService interviewPracticeService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;

	@GetMapping("/interviewPracticeAdmin.do")
	public String selectPracticeAdmin(@RequestParam(defaultValue = "1") int cPage, 
									  @RequestParam (value="msg",required=false) String msg, 
									  @RequestParam (value="question_kind",required=false) String question_kind, 
									  @RequestParam (value="admin_approval",required=false) String admin_approval, 
									  HttpServletRequest request,
									  
									  Model model) {
		log.debug("{}", "practiceAdmin.do 요청!");
		int limit = 10;
		int offset = (cPage - 1) * limit;
		Map<String,String> map = new HashMap<String, String>();
		String question_kind_url = "";
		String admin_approval_url = "";
		if(!StringUtils.isEmpty(question_kind))
			question_kind_url = question_kind;
			map.put("question_kind", question_kind);
		if(!StringUtils.isEmpty(admin_approval)) {
			admin_approval_url = admin_approval;
			map.put("admin_approval", admin_approval);
		}
		System.out.println("map : " + map);
		String url = request.getRequestURI(); // /spring/board/boardList.do
		int totalContent = interviewPracticeService.selectAdminTotalCount(map);
		

		List<InterviewQuesionPractice> IQList = interviewPracticeService.selectPracticeAdmin(offset,limit,map);
		String pagebar = HiSpringUtils.getPagebarAdmin(cPage, limit, totalContent, url, question_kind_url, admin_approval_url);
		
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("IQList",IQList);
		model.addAttribute("pagebar", pagebar);
		return "untact_interview_statistics_practice/interview_practice/interviewPracticeAdmin";
	}
	
	@GetMapping("/interviewPractice.do")
	public String practice(HttpSession session, Model model, RedirectAttributes redirectAttr) {
//		premium
		Member loginMember = (Member) session.getAttribute("loginMember");
		if(loginMember == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/member/loginForm.do";
		}else {
			log.debug("{}", "practice.do 요청!");
			model.addAttribute("premium", loginMember.getEndYN());
			return "untact_interview_statistics_practice/interview_practice/interviewPractice";
		}
	}
	@GetMapping("/interviewPracticeMenu.do")
	public String practiceMenu() {
		log.debug("{}", "practiceMenu.do 요청!");
		return "untact_interview_statistics_practice/interview_practice/interviewMenu";
	}
	
	@GetMapping("/interviewPracticeUpdate.do")
	public String updateInterviewPracticeAdmin(@RequestParam int question_no, RedirectAttributes redirectAttributes) {
		System.out.println(question_no);
		log.debug("{}", "interviewPracticeAdmin.do 요청!");
		int result = interviewPracticeService.updatePracticeAdmin(question_no);
		redirectAttributes.addAttribute("msg", result >0 ? "승인요청확인성공":"승인요청확인실패");
		return "redirect:/interviewPractice/interviewPracticeAdmin.do";
	}
	
	@PostMapping("/interviewePracticeinsert.do")
	public String insertInterviewePractice(@ModelAttribute InterviewQuesionPractice iqpFrm, Model model,HttpSession session,RedirectAttributes redirectAttr) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if(loginMember == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/member/loginForm.do";
		}else {
				
			log.debug("{}", "interviewePracticeinsert.do 요청!");
			int result = interviewPracticeService.insertInterviewePractice(iqpFrm);
			redirectAttr.addFlashAttribute("msg", result >0 ? "면접 연습 질문 추가에 성공하였습니다.":"면접 연습 질문 추가에 실패하였습니다.");
			//후에는 마이페이지로 이동
	//		if("IR".equals(loginMember.getKind())) {
	//			return "redirect:/member/irMyPage.do";
	//			
	//		}else if("IR_SUPERVISOR".equals(loginMember.getKind())) {
	//		}else if("IR_HAED".equals(loginMember.getKind())) {
	//			return "redirect:/member/irHMyPage.do";
	//			
	//		}else if("USER".equals(loginMember.getKind())) {
	//			return "redirect:/member/irHMyPage.do";
	//			
	//		}
			return "redirect:/interviewPractice/interviewePracticeinsertFrm.do";
		}
	}	
	@GetMapping("/interviewePracticeinsertFrm.do")
	public String interviewePracticeinsertFrm() {
		log.debug("{}", "interviewePracticeinsertFrm.do 요청!");
		return "untact_interview_statistics_practice/interview_practice/interviewPracticeEnroll";
	}	
	/*
	 * @PostMapping("/interviewPracticeDev.do") public @ResponseBody
	 * InterviewQuesionPractice interviewPracticeExcept(@RequestParam Map<String,
	 * Object> param, Model model) { String kind = "D";
	 * List<InterviewQuesionPractice> selectPractice =
	 * interviewPracticeService.selectPracticeList(kind); for(int a = 0; a <
	 * selectPractice.size(); a ++) if(selectPractice.get(a).getQuestion_no() ==
	 * (int)param.get("question_no")) {
	 * 
	 * }
	 * 
	 * int randoms = (int)(Math.random() * selectPractice.size()-1);
	 * InterviewQuesionPractice ip = selectPractice.get(randoms); String[] splits =
	 * ip.getAnswer().split(","); String answer = ""; for(int a = 0; a <
	 * splits.length; a++) answer += splits[a] + (a!=splits.length -1 ? "<br>" :
	 * ""); ip.setAnswer(answer);
	 * 
	 * model.addAttribute("selectPractice",selectPractice);
	 * model.addAttribute("selectPracticeRandom",ip);
	 * 
	 * return ip; }
	 */
	
	/*
	 * @GetMapping("/interviewPracticeDevCount.do") public void
	 * interviewPracticeDevAgain(HttpServletResponse rs, Model model, @RequestParam
	 * int no) { try { JSONObject jso = new JSONObject(); jso.put("data", no-1);
	 * rs.setContentType("text/html; charset=utf-8"); PrintWriter out =
	 * rs.getWriter(); out.print(jso.toString()); }catch(Exception e) {
	 * log.debug("e = {}", e); } }
	 */
	
	@RequestMapping(value="/interviewPracticeQuestion" , method = {RequestMethod.GET, RequestMethod.POST})
	public String selectOnePractice(@RequestParam String rate, @RequestParam String kind, @RequestParam (value="Questions",required=false) String Questions, Model model) {

		System.out.println("rate = {}"+ rate);
		log.debug("selectPracticestartDev = {}", "interviewPracticeQuestion.do 요청!");
		List<InterviewQuesionPractice> selectPractice = null;
		System.out.println("kind : "+ kind);
		Map<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		if(StringUtils.isEmpty(Questions)) { 
			selectPractice = interviewPracticeService.selectPracticeList(map);
		}else {
			System.out.println("Questions : "+ Questions);
		    List<Integer> no_List = new ArrayList<Integer>();
		    
		    for(String a :Questions.split(",")) {	
		    	no_List.add(Integer.parseInt(a)); //in 조건에 넣을 정보
		    }
		    
			map.put("Questions", no_List);
			selectPractice = interviewPracticeService.selectPracticeList(map);
		}

		model.addAttribute("selectPractice",selectPractice);
		
// 면접연습의 질문 줄 한개의 값을 선택해서 보내주기.
// jsp에서 면접 다른 질문 연습하기 라는 버튼을 클릭하면 이미 연습했던 질문을 제외한 리스트를 불러와 랜덤값을 돌리기
// -> jsp에서 selectPractice부분에서 selectPracticeRandom를 제외하고 보내줘야되는데 어떻게 보내줘야되는거지
// 혹은 그냥 해당 Qusion부분 다시 실행하고 해당 부분 제외하고 랜덤값 돌려서... 보내기?
// -> 비효율적일거 같은데... 아! 해당 부분 다른 질문 연습하기 눌렀을 때는 

// 면접 리스트 부분과 현재 면접 질문 같이 보내서 제외하고 랜덤 값과 리스트 다시 속성으로 정하고 
// 해당 부분 다시 불러와서 처리하는 함수 만들어서 적용하기? ->  ajax 사용해서 처리하기?

		int randoms = (int)(Math.random() * selectPractice.size()-1);
		InterviewQuesionPractice ip = selectPractice.get(randoms);
		if(kind == "D" || "D".equals(kind)) {
			String[] splits = ip.getAnswer().split(",");
			String answer = "";
			for(int a = 0; a < splits.length; a++)
				answer += splits[a] + (a!=splits.length -1 ? "<br>" : "");
			log.debug("answer = {}", answer);
			ip.setAnswer(answer);
			
		}
		//면접 연습을 했던 부분은 더하기 눌렀을 때 안되게 하기.
		if(StringUtils.isEmpty(Questions)) { 
			Questions = "";
		}else {
			Questions += ",";
		}	

		
		model.addAttribute("selectPracticeRandom", ip);
		model.addAttribute("listSize", selectPractice.size());
		model.addAttribute("Questions", Questions + ip.getQuestion_no());
		model.addAttribute("rate", rate);
		
		return "untact_interview_statistics_practice/interview_practice/interviewPracticeDetail";
	}

	/**
	 * URL Resource
	 * - 외부자원
	 * - 웹크롤링
	 * 
	 * @return
	 */
	@GetMapping(
		value = "/resource.do",
		produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
	)
	@ResponseBody
	public Resource resource(HttpServletResponse response) {
		Resource resource = resourceLoader.getResource("https://docs.oracle.com/javase/8/docs/api/java/io/File.html");
		log.debug("resource = {}", resource);
		response.addHeader("Content-Disposition", "attachment; filename=File.html");
		return resource;
	}
	
}





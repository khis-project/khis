package com.kh.khis.untact_interview_statistics_practice.untact_interview.controller;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.service.UntactInterviewService;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;
import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.untact_interview_statistics_practice.common.HiSpringUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/untactInterview")
public class UntactInterviewController {
	
	/**
	 * @Autowired 
	 * - 타입일치 빈
	 * - 이름과 일치하는 빈
	 */
	@Autowired
	private UntactInterviewService untactInterviewService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;

	@GetMapping("/zoom.do")
	public String Zoom(@RequestParam(defaultValue = "1") int cPage, 
						Model model,
						HttpServletRequest request,
						HttpSession session,
						RedirectAttributes redirectAttr
			) {
		log.debug("{}", "zoom.do 요청!");
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/";
		}else {
			int member_no = member.getMemberNo(); // 추후에는 해당 면접관리자의 member_no 가져오기
			int limit = 5;
			int offset = (cPage - 1) * limit;
			
			log.debug("{} {}", untactInterviewService, untactInterviewService.getClass());
			List<Zoom> zoomList = untactInterviewService.selectZoomList(offset,limit,member_no);
			model.addAttribute("zoomList", zoomList);
			
			int totalContent = untactInterviewService.selectZoomTotalCount(member_no);
			log.debug("totalContent = {}", totalContent);
			model.addAttribute("totalContent", totalContent);
			
			String url = request.getRequestURI(); // /spring/board/boardList.do
			String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			model.addAttribute("pagebar", pagebar);
			
			return "untact_interview_statistics_practice/untact_interview/zoomEnroll";
		}
	}
	
//	@RequestMapping(value="/zoomMeetingConnect.do" , method = {RequestMethod.GET, RequestMethod.POST})
//	public String zoomMeetingConnect( @RequestParam String joinUrl, Model model) {
//		
//		int member_no = 111; // 나중에는 해당 클릭했을때 클릭한 member_no 가져오기
//		Zoom zoomInfo = untactInterviewService.selectZoomIr_Info(member_no);
//		
//		
//		log.debug("zoomConnect = {}", "/zoomConnect.do 요청!");
//		log.debug("joinUrl = {}", "/joinUrl.do 요청!");
//		
//		Map<String,String> map = new HashMap<String, String>();
////		map.put("name",name);
////		map.put("mn",zoomInfo.getZoom_number());
////		map.put("pwd",zoomInfo.getZoom_password());
////		map.put("role",role);
////		map.put("lang",role);
//		
//		String[] params = joinUrl.split("&"); //url 쪼개기
//		for(String param : params) {
//			System.out.println(param.toString());
//			String name = param.split("=")[0];
//			String value = param.split("=", -1)[1]; // null처리를 위함
//			map.put(name,value);
//		}
//		model.addAttribute("ZoomUrl", map);
//		return "untact_interview_statistics_practice/CDN/index";
//	}
	
	//zoom 연결하는 메인 페이지 이동
	@RequestMapping(value="/zoomConnect.do" , method = {RequestMethod.GET, RequestMethod.POST})
	public String zoomConnect() {

		return "untact_interview_statistics_practice/CDN/index";
	}
	
	// 연결 시 해당 면접관에 대한 정보 가져와서 뿌려주기
	@RequestMapping(value="/zoomMeetingConnect.do" , method = {RequestMethod.GET, RequestMethod.POST})
	public String zoomMeetingConnect(@RequestParam String kind , Model model,
									HttpSession session,
									RedirectAttributes redirectAttr) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/";
		}else {		
			int member_no = member.getMemberNo(); // 나중에는 해당 클릭했을때 클릭한 member_no 가져오기
			Zoom zoomInfo = untactInterviewService.selectZoomIr_Info(member_no);
			String name = "R".equals(kind) ? "면접관" : zoomInfo.getName(); 
			String role = "R".equals(kind) ? "1" : "0";
			
			
			log.debug("zoomConnect = {}", "/zoomConnect.do 요청!");
			log.debug("joinUrl = {}", "/joinUrl.do 요청!");
			
			Map<String,String> map = new HashMap<String, String>();
			map.put("name",name);
			map.put("mn", zoomInfo.getZoom_number());
			map.put("pwd",zoomInfo.getZoom_password());
			map.put("role",role);
			map.put("lang","ko-KO");
			map.put("china","0");
			map.put("apiKey",zoomInfo.getApi_key());
			map.put("apiSec",zoomInfo.getApi_secret());
			
			model.addAttribute("ZoomUrl", map);
			return  "untact_interview_statistics_practice/CDN/meeting";
		}
	}

	@PostMapping("zoomEnroll.do")
	public String insertZoom(@ModelAttribute Zoom zoom, 
			RedirectAttributes redirectAttributes,
			HttpSession session,
			RedirectAttributes redirectAttr) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/";
		}else {

			zoom.setMember_no(member.getMemberNo());
			zoom.setCo_code(member.getCoCode().intValue());
			log.debug("zoom = {}",zoom);
			try {
				int result = untactInterviewService.insertZoom(zoom);
				String msg = result > 0 ? "zoom api 등록 성공하였습니다." : "zoom api 등록 실패하였습니다.";
				redirectAttributes.addFlashAttribute("msg", msg);
			} catch (Exception e) {
				log.error("zoom api 정보 등록 오류", e);
				throw e;
			}
			return "redirect:/untactInterview/zoomList.do";
		}
	}
	
	@GetMapping("zoomDetail.do")
	public String selectzoom(@RequestParam String zoom_no, Model model) {
		int zoom_no_int = Integer.parseInt(zoom_no);
		
		Zoom zoom = untactInterviewService.selectZoom(zoom_no_int);

		model.addAttribute("zoomDetail", zoom);
	
		return "untact_interview_statistics_practice/untact_interview/zoomDetail";
	}
	
	@PostMapping("zoomUpdate.do")
	public String Updatezoom(@ModelAttribute Zoom zoom, Model model, RedirectAttributes redirectAttr) {
		System.out.println("zoom : " + zoom);
		int result = untactInterviewService.updateZoom(zoom);
		String msg = result > 0 ? "zoom api 수정에 성공하였습니다." : "zoom api 수정에 실패하였습니다.";
		redirectAttr.addFlashAttribute("msg",msg);
		model.addAttribute("msg", msg);
		
		return "redirect:/untactInterview/zoomList.do";
	}
	
	
	@GetMapping("zoomDelete.do")
	public String deleteZoom(@RequestParam String zoom_no, Model model, RedirectAttributes redirectAttr) {
		
		int zoom_no_int = Integer.parseInt(zoom_no);
		int result = untactInterviewService.deleteZoom(zoom_no_int);
		String msg = result > 0 ? "zoom zpi 삭제에 성공하였습니다." : "zoomapi삭제실패!";
		model.addAttribute("msg", msg);
		redirectAttr.addFlashAttribute("msg",msg);
		return "redirect:/untactInterview/zoomList.do";
	}
	
	//줌 회의실 사용 설명서로 이동
	@GetMapping("zoomHowToUse.do")
	public String zoomHowToUse() {
		
		return "untact_interview_statistics_practice/untact_interview/zoomHowToUse";
	}	

	 // 줌 리스트 출력

	@GetMapping("zoomList.do")
	public String selectZoomList(@RequestParam(defaultValue = "1") int cPage, 
			HttpServletRequest request,@RequestParam (value="msg",required=false) String msg, 
			Model model,
			HttpSession session,
			RedirectAttributes redirectAttr) {
		
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/";
		}else {
			int member_no = member.getMemberNo(); // 추후에는 해당 면접관리자의 member_no 가져오기
			int limit = 5;
			int offset = (cPage - 1) * limit;
		
	
			if(!StringUtils.isEmpty(msg)) {
				model.addAttribute("msg", msg);
			}
			// 여기서 배정된 인원수 (List<회의실, 회의실번호>), 
			// 해당 회의실에 배정된 사람,  
			// 회의실번호와 api key 속성
			
			List<Zoom> zoomList = untactInterviewService.selectZoomList(offset, limit, member_no);	
			List<Zoom> selectZoomIRList = untactInterviewService.selectZoomIRList(member_no);	
			log.debug("{} {}", untactInterviewService, untactInterviewService.getClass());
			
			int totalContent = untactInterviewService.selectZoomTotalCount(member_no);
			log.debug("totalContent = {}", totalContent);
			model.addAttribute("totalContent", totalContent);
			
			String url = request.getRequestURI(); // /spring/board/boardList.do
			String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			model.addAttribute("pagebar", pagebar);
			
			Map<String,Integer> zoomnum = new HashMap<>(); //배정된 인원수
			// zoomList; //배정된 인원수, 해당 회의실에 배정된 사람들
			
			log.debug("zoomList = {}", zoomList);
			System.out.println("zoomList" + zoomList);
			System.out.println("selectZoomApiList" + selectZoomIRList);
	
	//		for(Zoom z : zoomList) {
	//			Zoom zz = new Zoom();
	//			String zoom_number = z.getZoom_number();
	//			String zoomnum_key = zoom_number + "," + z.getRole();
	//
	////			log.debug("zoomList for문의 요소 = {}", z);
	//			zz.setApi_key(z.getApi_key()); // zoom api key
	//			zz.setZoom_number(zoom_number); //zoom 회의실번호
	//			zz.setZoom_no(z.getZoom_no()); //zoom 회의실번호
	//			
	//			zz.setZoom_password(z.getZoom_password()); //zoom password
	//			if(!zoom.contains(zz)) // 해당 회의실에 대한 정보가 존재하면 list에 추가하지 않는다.
	//				zoom.add(zz);
	//			if(!zoomnum.containsKey(zoomnum_key)) { // 회의실과 사용자의 분류(면접자/면접관)에 따라 인원수 변경
	//				if(z.getRole() == null) 
	//					zoomnum.put(zoomnum_key, 0);
	//				else
	//					zoomnum.put(zoomnum_key, 1);
	//			} else {
	//				zoomnum.put(zoomnum_key, zoomnum.get(zoomnum_key) + 1);
	//			}
	//		}
			
			for(Zoom z : selectZoomIRList) {
	
	//		String zoom_number = z.getZoom_number();
			String zoomnum_key = z.getZoom_number() + "," + z.getRole();
	
			//zoomnum.put(zoomnum_key, 0); 이런식으로 추가
	//		log.debug("zoomList for문의 요소 = {}", z);
	
	
				if(!zoomnum.containsKey(zoomnum_key)) { // 회의실과 사용자의 분류(면접자/면접관)에 따라 인원수 변경
					if(z.getRole() == null) 
						zoomnum.put(zoomnum_key, 0);
					else
						zoomnum.put(zoomnum_key, 1);
				} else {
					zoomnum.put(zoomnum_key, zoomnum.get(zoomnum_key) + 1);
				}
			}
			
			
			log.debug("zoom 회의실에 포함된 사용자 zoomnum = {}", zoomnum);
			System.out.println("zoom 회의실에 포함된 사용자 zoomnum = "+ zoomnum);
			model.addAttribute("zoom_number", zoomnum); // 회의실에 배정된 인원수
	//		model.addAttribute("zoom", zoom); // 회의실 중복제거
			model.addAttribute("zoom", selectZoomIRList); // 회의실 중복제거
			model.addAttribute("zoomList", zoomList); 
			return "untact_interview_statistics_practice/untact_interview/zoomList";
		}
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





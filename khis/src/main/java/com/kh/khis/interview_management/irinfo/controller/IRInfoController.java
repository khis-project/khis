package com.kh.khis.interview_management.irinfo.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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

import com.kh.khis.interview_management.common.IRManagementUtils;
import com.kh.khis.interview_management.irinfo.model.service.IRInfoService;
import com.kh.khis.interview_management.irinfo.model.vo.AssignedInfo;
import com.kh.khis.interview_management.irinfo.model.vo.IRInfo;
import com.kh.khis.interview_management.irinfo.model.vo.IRPath;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewTime;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerCareer;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerCertificate;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerInfo;
import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/irmanagement")
@Slf4j
public class IRInfoController {

	@Autowired
	private IRInfoService irinfoService;
	
	@GetMapping("/irIndex.do")
	public String irIndex() {
		return "/interview_management/irinfo/irIndex";
	}
	
	@GetMapping("/insertInterviewer.do")
	public String insertInterviewer(HttpSession session, Model model, RedirectAttributes redirectAttr) {
		Member member = (Member) session.getAttribute("loginMember");
		log.debug("member = {}", member);
		if(member == null) {
 			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
 			return "redirect:/member/loginForm.do";
		}else {
			
			int memberNo = member.getMemberNo();
			// 1. 면접자 insert시 필요한 zoom 회의실 정보 담아서 보내기 : 회의실 정보 있어야 view에서 확인 후 처리 가능
			List<Zoom> zoomList = irinfoService.selectZoomList(memberNo);
			log.debug("zoomList = {}", zoomList);
			model.addAttribute("zoomList", zoomList);
			
			List<IRPath> irPathList = irinfoService.selectIRPathList();
			log.debug("irPathList = {}", irPathList);
			model.addAttribute("irPathList", irPathList);
	 		return "/interview_management/irinfo/insertInterviewer";
		}
	}

	@PostMapping("/insertInterviewer.do")
	public String insertInterviewer(
			IRInfo irInfo,
//			@RequestParam String coCode,
//			@RequestParam String name,
//			@RequestParam String email,
//			@RequestParam String phone,
//			@RequestParam String category,
//			@RequestParam String role,
//			@RequestParam String zoomNo,
//			@RequestParam String interviewerInfoNo,
//			@RequestParam String memberIrHaedNo,
			
			HttpServletRequest request, RedirectAttributes redirectAttr)
			throws ParseException {
//		IRInfo irInfo = new IRInfo();
//		irInfo.setCoCode(Integer.parseInt(coCode));
//		irInfo.setName(name);
//		irInfo.setEmail(email);
//		irInfo.setPhone(phone);
//		irInfo.setCategory(category);
//		irInfo.setRole(role);
//		irInfo.setZoomNo(Integer.parseInt(zoomNo));
//		irInfo.setInterviewerInfoNo(Integer.parseInt(interviewerInfoNo));
//		irInfo.setMemberIrHaedNo(Integer.parseInt(memberIrHaedNo));
		
		String msg = null;
		int checkDuplicate = irinfoService.checkDuplicate(irInfo);
		String location = null;
		
		if (checkDuplicate == 0) {
			String ssn1 = request.getParameter("ssn1");
			String ssn2 = request.getParameter("ssn2");
			String ssn = ssn1 + "-" + ssn2;
			irInfo.setSsn(ssn);

			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String jobPostingName = request.getParameter("jobPostingName");
			log.debug("request.starttime = {}, request.endtime = {}", startTime, endTime);

			InterviewTime interviewTime = new InterviewTime();
			interviewTime.setJobPostingName(jobPostingName);

			if (startTime != null && endTime != null) {

				Date startTimeToDate = new SimpleDateFormat("yyyy-MM-dd'T'KK:mm").parse(startTime);
				long time1 = startTimeToDate.getTime();
				Timestamp ts = new Timestamp(time1);

				log.debug("ts = {}", ts);
				Date endTimeToDate = new SimpleDateFormat("yyyy-MM-dd'T'KK:mm").parse(endTime);
				long time2 = endTimeToDate.getTime();
				Timestamp ts2 = new Timestamp(time2);
				log.debug("ts2 = {}", ts2);

				interviewTime.setStartTime(ts);
				interviewTime.setEndTime(ts2);

				log.debug("interviewTime = {}", interviewTime);

				irInfo.setInterviewTime(interviewTime);
			}
			log.debug("irInfo = {}", irInfo);
			int result = irinfoService.insertInterviewer(irInfo);

			msg = result > 0 ? "사용자 등록 성공" : "사용자 등록 실패";
			redirectAttr.addFlashAttribute("msg", msg);
			location = "irmanagement/irList.do";
		} else {
			msg = "사용자 정보 등록 중 중복되는 정보를 확인했습니다. 확인 후 다시 입력 바랍니다.";
			redirectAttr.addFlashAttribute("msg", msg);
			location = "irmanagement/insertInterviewer.do";
		}

		return "redirect:/" + location;
	}

	@GetMapping("/insertRater.do")
	public String insertRater(Model model, HttpSession session, RedirectAttributes redirectAttr) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
 			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
 			return "redirect:/member/loginForm.do";
		}else {
			int memberNo = member.getMemberNo();
			// 2. 면접관 insert시 필요한 면접자 정보 담아서 보내기 
			List<IRInfo> interviewerList = irinfoService.selectInterviewerList(memberNo);
			log.debug("interviewerList = {}", interviewerList);
			model.addAttribute("interviewerList", interviewerList);
		 		
	 		return "/interview_management/irinfo/insertRater";
		}
	}
	
	@PostMapping("/insertRater.do")
	public String insertRater(IRInfo irInfo, HttpServletRequest request, RedirectAttributes redirectAttr) {
		int result = 0;
		int checkDuplicate = irinfoService.checkDuplicate(irInfo);
		String location = "";
		String msg = "";
		
		if(checkDuplicate == 0) {
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String ssn = ssn1 + "-" + ssn2;
		irInfo.setSsn(ssn);
		
		String[] memberNoList = request.getParameterValues("assignedInfoNo");
		log.debug("assignedInfoNo = {}", Arrays.toString(memberNoList));

		result  = irinfoService.insertRater(irInfo, memberNoList);
		
		
		log.debug("irInfo = {}", irInfo);
		
		
		msg = result > 0 ? "사용자 등록 성공"  : "사용자 등록 실패";
		redirectAttr.addFlashAttribute("msg", msg);
		location = "irmanagement/irList.do";
		
		} else {
			msg = "사용자 정보 등록 중 중복되는 정보를 확인했습니다. 확인 후 다시 입력 바랍니다.";
			redirectAttr.addFlashAttribute("msg", msg);
			location = "irmanagement/insertRater.do";
		}

		return "redirect:/" + location;
	}
	

	
	@GetMapping("/irList.do")
	public String irList(@RequestParam(defaultValue = "1") int cPage, 
			Model model, HttpServletRequest request
			,HttpSession session, RedirectAttributes redirectAttr) {
		
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/member/loginForm.do";
		}else {
			long co_code = member.getCoCode();
			int limit = 10;
			int offset = (cPage - 1) * limit;
			List<IRInfo> list = irinfoService.selectInfoList(offset, limit, co_code);
			
			log.debug("list = {}", list);
			model.addAttribute("list", list);
			int totalContent = irinfoService.selectIRInfoTotalCount(co_code);
			
			String url = request.getRequestURI(); // /spring/board/boardList.do
			String pagebar = IRManagementUtils.getPagebar(cPage, limit, totalContent, url);		
			
			model.addAttribute("pagebar", pagebar);
			return "/interview_management/irinfo/irList";
		}
	}
	
	@GetMapping("/irDetail.do")
	public String irDetail(@RequestParam int memberInfoNo, Model model) {
		log.debug("memberInfoNo = {}", memberInfoNo);
		IRInfo irInfo = irinfoService.selectOneIRInfo(memberInfoNo);
		log.debug("irInfo = {}", irInfo);
		
		if("R".equals(irInfo.getRole())) {
			List<String> interviewerNameList = irinfoService.selectInterviewerName(memberInfoNo);
			model.addAttribute("interviewerNameList", interviewerNameList);
		}
		
		model.addAttribute("irInfo", irInfo);
		return "/interview_management/irinfo/irDetail";
	}
	
	@GetMapping("/irUpdate.do")
	public String irUpdate(@RequestParam int memberInfoNo, Model model, HttpSession session, RedirectAttributes redirectAttr) {
		log.debug("memberInfoNo = {}", memberInfoNo);
		IRInfo irInfo = irinfoService.selectOneIRInfo(memberInfoNo);
		String location = null;
		log.debug("irInfo = {}", irInfo);
		model.addAttribute("irInfo", irInfo);
		Member member = (Member) session.getAttribute("loginMember"); 
		if(member == null) {
			redirectAttr.addFlashAttribute("msg", "로그인 후 이용할 수 있습니다.");
			return "redirect:/member/loginForm.do";
		}else {
			int memberNo = member.getMemberNo();
			
			if("I".equals(irInfo.getRole())) {
				// 회의실 리스트 : 세션의 loginMember객체에서 회원번호로 불러오기
				List<Zoom> zoomList = irinfoService.selectZoomList(memberNo);
				log.debug("zoomList = {}", zoomList);
				model.addAttribute("zoomList", zoomList);
				
				List<IRPath> irPathList = irinfoService.selectIRPathList();
				log.debug("irPathList = {}", irPathList);
				model.addAttribute("irPathList", irPathList);
				
				InterviewTime interviewTime = irinfoService.selectOneInterviewTime(memberInfoNo);
				log.debug("interviewTime = {}", interviewTime);
				model.addAttribute("interviewTime", interviewTime);
				location = "/interview_management/irinfo/updateInterviewer";
				
			} else if("R".equals(irInfo.getRole())) {
				
				// 총 면접자 리스트 : 세션의 loginMember객체에서 회원번호로 불러오기
				List<IRInfo> interviewerList = irinfoService.selectInterviewerList(memberNo);
				log.debug("interviewerList = {}", interviewerList);
				model.addAttribute("interviewerList", interviewerList);
				
				// 해당 면접관에게 배정된 면접자 리스트
				List<AssignedInfo> assignedInfoList = irinfoService.selectAssignedInfoList(memberInfoNo);
				log.debug("assignedInfoList = {}", assignedInfoList);
				model.addAttribute("assignedInfoList", assignedInfoList);
				location = "/interview_management/irinfo/updateRater";
			}
			
			log.debug("location = {}", location);
			return location;
		}
	}
	
	
	@PostMapping("/updateInterviewer.do")
	public String updateInterviewer(IRInfo irInfo, HttpServletRequest request, RedirectAttributes redirectAttr) throws ParseException {
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String jobPostingName = request.getParameter("jobPostingName");
		log.debug("request.starttime = {}, request.endtime = {}", startTime, endTime);
		
		InterviewTime interviewTime = new InterviewTime();
		interviewTime.setJobPostingName(jobPostingName);
		
		if(startTime != null && endTime != null) {

			Date startTimeToDate = new SimpleDateFormat("yyyy-MM-dd'T'KK:mm").parse(startTime);
			long time1 = startTimeToDate.getTime();
			Timestamp ts = new Timestamp(time1);
			
			log.debug("ts = {}", ts);
			Date endTimeToDate = new SimpleDateFormat("yyyy-MM-dd'T'KK:mm").parse(endTime);
			long time2 = endTimeToDate.getTime();
			Timestamp ts2 = new Timestamp(time2);
			log.debug("ts2 = {}", ts2);

			interviewTime.setStartTime(ts);
			interviewTime.setEndTime(ts2);

			log.debug("interviewTime = {}", interviewTime);

			irInfo.setInterviewTime(interviewTime);
		}
		log.debug("update : irInfo = {}", irInfo);
		int result = irinfoService.updateInterviewer(irInfo);
		String msg = result > 0 ? "수정 성공" : "수정 실패";
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/irmanagement/irDetail.do?memberInfoNo=" + irInfo.getMemberInfoNo();
	}
	
	@PostMapping("/updateRater.do")
	public String updateRater(IRInfo irInfo, HttpServletRequest request, RedirectAttributes redirectAttr) {
		
		String[] memberNoList = request.getParameterValues("assignedMemberInfoNo");
		log.debug("assignedInfoNo = {}", Arrays.toString(memberNoList));

		int result  = irinfoService.updateRater(irInfo, memberNoList);
		
		String msg = result > 0 ? "수정 성공"  : "수정 실패";
		redirectAttr.addFlashAttribute("msg", msg);
//		
		return "redirect:/irmanagement/irList.do";
	}
	
	@PostMapping("/irDelete.do")
	public String irDelete(@RequestParam int memberInfoNo, RedirectAttributes redirectAttr) {
		log.debug("memberInfoNo = {}", memberInfoNo);
		int result = irinfoService.deleteIRInfo(memberInfoNo);
		String msg = result > 0 ? "사용자 정보 삭제 성공" : "사용자 정보 삭제 실패";
		redirectAttr.addFlashAttribute("msg", msg);
		return "redirect:/irmanagement/irList.do";
	}
	
	@GetMapping("/interviewerInfo.do")
	public String interviewerInfo() {
		return "/interview_management/irinfo/interviewerInfo";
	}
	
	@PostMapping("/insertInterviewerInfo.do")
	@ResponseBody
	public int insertInterviewerInfo(
			InterviewerInfo interviewerInfo, 
			InterviewerCareer interviewerCareer, 
			InterviewerCertificate interviewerCertificate, 
			HttpServletRequest request,
			Model model, 
			RedirectAttributes redirectAttr ) {
		log.debug("interviewerInfo ={}", interviewerInfo);
		log.debug("interviewerCareer ={}", interviewerCareer);
		log.debug("interviewerCertificate ={}", interviewerCertificate);
//		log.debug("interviewCareer.getCompanyName = {}", interviewerCareer.getCompanyName());
		
		// 매개변수로 보낼 map객체
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("interviewerInfo", interviewerInfo);
		
		Map<String, Object> careerMap ; 
		// careerList에 담을 map객체
		List<Map<String, Object>> careerList = new ArrayList<Map<String, Object>>();
		
		if (interviewerCareer.getCompanyName() != null) {
			for (int i = 0; i < interviewerCareer.getCompanyName().length; i++) {
				careerMap = new HashMap<String, Object>();

				careerMap.put("companyName", interviewerCareer.getCompanyName()[i]);
				careerMap.put("careerTerm", interviewerCareer.getCareerTerm()[i]);
				careerMap.put("careerStartTime", interviewerCareer.getCareerStartTime()[i]);
				careerMap.put("careerEndTime", interviewerCareer.getCareerEndTime()[i]);

				log.debug("careerMap = {}", careerMap);

				careerList.add(careerMap);
			}
		} else {
			careerMap = new HashMap<String, Object>();

			careerMap.put("companyName", "");
			careerMap.put("careerTerm", "");
			careerMap.put("careerStartTime", "");
			careerMap.put("careerEndTime", "");

			log.debug("careerMap = {}", careerMap);

			careerList.add(careerMap);
		}
		
		log.debug("careerList = {}", careerList);
		paramMap.put("careerList", careerList);
		
		Map<String, Object> certificateMap = new HashMap<>();
		List<Map<String, Object>> certificateList = new ArrayList<Map<String, Object>>() ;
		
		if(interviewerCertificate.getCertificateName() != null) {
			for(int i = 0; i < interviewerCertificate.getCertificateName().length; i++) {
				certificateMap = new HashMap<String, Object>();
				certificateMap.put("certificateName", interviewerCertificate.getCertificateName()[i]);
				certificateMap.put("certificateIssuer", interviewerCertificate.getCertificateIssuer()[i]);
				certificateMap.put("certificateDate", interviewerCertificate.getCertificateDate()[i]);
				
				certificateList.add(certificateMap);
			}
			
		} else {
			certificateMap = new HashMap<String, Object>();
			certificateMap.put("certificateName", "");
			certificateMap.put("certificateIssuer", "");
			certificateMap.put("certificateDate", "");
			
			certificateList.add(certificateMap);
		}
		
		log.debug("certificateList = {}", certificateList);
		paramMap.put("certificateList", certificateList);
		
		log.debug("paramMap = {}", paramMap);
		
		int result = irinfoService.insertInterviewerInfo(paramMap);
		
		log.debug("result = {}", result);
		
		int returnNumber = (int) paramMap.get("interviewerInfoNo");
		log.debug("returnNumber = {}", returnNumber);

		return returnNumber;
	}
	
	@GetMapping("/interviewerInfoDetail.do")
	public String interviewerInfoDetail(@RequestParam(value = "interviewerInfoNo") int interviewerInfoNo, Model model) {
		log.debug("interviewerInfoNo = {}", interviewerInfoNo);
		
		IRInfo irInfo = irinfoService.selectOneIRInfoByInterviewerInfoNo(interviewerInfoNo);
		model.addAttribute("irInfo", irInfo);
		
		InterviewerInfo interviewerInfo = irinfoService.selectOneInterviewerInfo(interviewerInfoNo);
		log.debug("interviewerInfo = {}", interviewerInfo);
		model.addAttribute("interviewerInfo", interviewerInfo);
		
		List<InterviewerCareer> careerList = irinfoService.selectCareerList(interviewerInfoNo);
		log.debug("careerList = {}", careerList);
		model.addAttribute("careerList", careerList);
		
		List<InterviewerCertificate> certificateList = irinfoService.selectCertificateList(interviewerInfoNo);
		log.debug("careerList = {}", certificateList);
		model.addAttribute("certificateList", certificateList);
		
		return "/interview_management/irinfo/interviewerInfoDetail";
	}
}

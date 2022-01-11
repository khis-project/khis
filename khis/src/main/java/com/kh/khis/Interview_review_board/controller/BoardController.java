package com.kh.khis.Interview_review_board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.khis.Interview_review_board.BoardUtils;
import com.kh.khis.Interview_review_board.DetailUtils;
import com.kh.khis.Interview_review_board.model.service.BoardService;
import com.kh.khis.Interview_review_board.model.vo.Board;
import com.kh.khis.Interview_review_board.model.vo.BoardMemberCompany;
import com.kh.khis.Interview_review_board.model.vo.Occupation;
import com.kh.khis.login_join_mypage.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Interview_review_board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	ServletContext application;

	@Autowired
	ResourceLoader resourceLoader;

	// 면접 후기 게시판(회사 List 조회)
	@GetMapping("/boardList.do")
	public String boardList(
			Board board,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(name = "occupationCd", required = false) String occupationCd,
			Model model,
			BoardMemberCompany boardMemberCompany,
			HttpServletRequest request) {

		int limit = 8;
		int offset = (cPage - 1) * limit;
		
		// 전체 회사 목록 조회
		List<Occupation> allList = boardService.selectAllList(offset, limit, occupationCd);
		log.debug("allList = {}", allList);
		model.addAttribute("allList", allList);
		System.out.println(allList);
		
		// 전체게시물수 totalContent
		int totalContent = boardService.selectBoardTotalCount(occupationCd);
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
				
		// pagebar
		String url = request.getRequestURI(); // /spring/board/boardList.do
		String pagebar = BoardUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
	
		return "Interview_review_board/boardList";
	}

	// 게시판 내용 수정 (boardForm 부분에 기존의 후기 내용이 불러와진 것을 확인할 수 있다.)
	@GetMapping("/boardUpdate.do")
	public String boardUpdate(Board board, 
				@RequestParam String boardNo, 
				HttpServletRequest request,
				Model model) {
			
		Map<String, Object> mapParam = new HashMap<String,Object>();
		int param = Integer.parseInt(boardNo);
		List<Map<String, Object>> listMap = boardService.selectBoardDetailOne(param);
		
		String recruitments = listMap.get(0).get("RECRUITMENT_METHOD").toString();
		model.addAttribute("recruitments", recruitments);
		
		String year = listMap.get(0).get("INTERVIEW_DATE").toString().substring(0,4);
		String month = listMap.get(0).get("INTERVIEW_DATE").toString().substring(4,6);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		model.addAttribute("list", listMap);
		return "Interview_review_board/boardUpdateForm";
	}

	// 게시판 내용 삭제
	@GetMapping("/boardDelete.do")
	public String deleteBoard(@RequestParam int boardNo, RedirectAttributes redirectAttr) throws Exception{
	    System.out.println(boardNo);
		int result = boardService.deleteBoard(boardNo);
		redirectAttr.addFlashAttribute("msg",result > 0 ? "후기가 삭제되었습니다." : "후기 삭제가 되지 않았습니다.");
	    return "redirect:/Interview_review_board/boardList.do";
	}
		
	// 게시판 상세 내용 조회(회사 box 클릭시)

	@GetMapping("/boardDetail.do")
	public String boardDetail(
			Board board, 
			@RequestParam String coCode, 
			@RequestParam String occupationCode, 
			@RequestParam String score, 
			@RequestParam(defaultValue = "1") int cPage,
			HttpServletRequest request,
			Model model,
			HttpSession session,
			RedirectAttributes redirectAttr
			) {
		log.debug("cPage = {}", cPage);
		
		int limit = 2;
		int offset = (cPage - 1) * limit;
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("occupation_code", occupationCode);
		mapParam.put("co_code", coCode);
		List<Map<String, Object>> list = boardService.selectDetailList(mapParam, offset, limit);
		int interViewAvg = boardService.selectinterViewAvg(mapParam);
		
		model.addAttribute("list", list);
		model.addAttribute("score", score);
		model.addAttribute("interViewAvg", interViewAvg);

		
		// 전체게시물수 totalContent
		int totalContent = boardService.selectContentsTotalCount(coCode, occupationCode);
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
				
		// 페이징 처리
		String url = request.getRequestURL().toString() + "?" + request.getQueryString(); 		
		if(url.indexOf("&cPage") != -1) {
				url = url.substring(0, url.indexOf("&cPage"));					
		}
		
		String pagebar = DetailUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용해주세요.");
			return "redirect:/member/loginForm.do";
		}else {
			int memberNo = member.getMemberNo();
			
			model.addAttribute("MemberNo", memberNo);
			
			return "Interview_review_board/boardDetail";		 
			
		}
	}

	// 후기 게시판 작성
	@PostMapping("/boardEnroll.do")
	public String boardEnroll(Board board, RedirectAttributes redirectAttr, HttpServletResponse response, HttpServletRequest request, HttpSession session,
			@RequestParam(name = "boardNo", required = false) String boardNo,
			@RequestParam(name = "co_code") String coCode,
			@RequestParam(name = "pass_no") String pass_no,
			@RequestParam(name = "occupationCode") String occupationCode,
			@RequestParam(name = "employmentType") String employmentType,
			@RequestParam(name = "title") String title,
			@RequestParam(name = "interviewEvaluation") int interviewEvaluation,
			@RequestParam(name = "interviewQuestion") String interviewQuestion,
			@RequestParam(name = "interviewAnswer") String interviewAnswer,
			@RequestParam(name = "interviewDifficulty") String interviewDifficulty,
			@RequestParam(name = "passcheck") String passcheck,
			@RequestParam(name = "interviewPath") String interviewPath,
			@RequestParam(name = "interviewYear") String interviewYear,
			@RequestParam(name = "interviewMonth") String interviewMonth,
			@RequestParam(name = "announcementTime") String announcementTime,
			@RequestParam(name = "recruitmentMethod", defaultValue = "") String[] recruitmentMethods
			) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/member/loginForm.do";
		}else {
			System.out.println("pass_no=" + pass_no);
			//인터뷰 년도, 월 Date형으로 포맷
			String inputDate = interviewYear + interviewMonth;
			String outputDate = null;
			Date interviewDate = new Date();
			try {
			SimpleDateFormat sdf = new SimpleDateFormat("YYYYMM") ;
			interviewDate = sdf.parse(inputDate);
			outputDate = sdf.format(interviewDate);
			System.out.println(outputDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String recruitmentMethod = "";
			int i = 0;
			while(i < recruitmentMethods.length) {
				System.out.println(recruitmentMethod);
				if(i == recruitmentMethods.length-1) {
				recruitmentMethod += recruitmentMethods[i];
				}else {
				recruitmentMethod += recruitmentMethods[i] + ",";
				}
				i++;
			}

			board.setCoCode(coCode);
			board.setPass_no(Integer.parseInt(pass_no));
			board.setOccupationCode(Integer.parseInt(occupationCode));
			board.setMemberNo(member.getMemberNo());
			board.setInterviewEvaluation(interviewEvaluation);
			board.setEmploymentType(employmentType);
			board.setTitle(title);
			board.setInterviewDifficulty(interviewDifficulty);
			board.setInterviewPath(interviewPath);
			board.setInterviewDate(outputDate);
			board.setRecruitmentMethod(recruitmentMethod);
			board.setAnnouncementTime(announcementTime);
			board.setPasscheck(passcheck);
			board.setInterviewQuestion(interviewQuestion);
			board.setInterviewAnswer(interviewAnswer);
			if(boardNo != null && !boardNo.equals("")) {
				board.setBoardNo(Integer.parseInt(boardNo));
			}
			

			if(boardNo != null && !boardNo.equals("")) {
				try {
					int result = boardService.updateBoard(board);
					String msg = result > 0 ? "후기 수정에 성공하였습니다." : "후기 수정에 실패했습니다.";
					redirectAttr.addFlashAttribute("msg", msg);
				} catch (Exception e) { 
					log.error(e.getMessage(), e);
					throw e; // spring container에게 던짐.
				}
			}else {
				try {
					int result = boardService.insertBoard(board);
					String msg = result > 0 ? "후기 등록에 성공하였습니다." : "후기 등록에 실패하였습니다.";
					redirectAttr.addFlashAttribute("msg", msg);
				} catch (Exception e) { 
					log.error(e.getMessage(), e);
					throw e; // spring container에게 던짐.
				}
			}
			
			return "redirect:/Interview_review_board/boardList.do";
		}
	}

	// 게시판 후기작성폼(기업명 검색 부분에 회사 List를 불러옴.)
	@GetMapping("/boardForm.do")
	public String boardForm(
			Model model, 
			Board board,
			HttpServletRequest request,
			HttpSession session,
			RedirectAttributes redirectAttr
			) {

		// 여기서 폼으로 넘어가기전에 후기 작성할 데이터가 있는지 확인하기
		// select 해야 됨.
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			redirectAttr.addFlashAttribute("msg","로그인 후 이용할 수 있습니다.");
			return "redirect:/member/loginForm.do";
		}else {
			if(!member.getKind().equals("IR")) {
				redirectAttr.addFlashAttribute("msg","글을 작성할 권한이 없습니다.");
				return "redirect:/Interview_review_board/boardList.do";				
			}else {
				int member_info_no = member.getMemberInfoNo();
				//List<BoardMemberCompany> list = boardService.selectCompanyList();
				List<BoardMemberCompany> list = boardService.selectCompanyList(member_info_no);
				// list를 쿼리문만 수정하면 될듯
				if(list.isEmpty()) {
					redirectAttr.addFlashAttribute("msg", "추가할 수 있는 후기가 없습니다.");
					return "redirect:/Interview_review_board/boardList.do";
				}
				model.addAttribute("list",list);
			}
		}
		return "Interview_review_board/boardForm";
	}

	
	@RequestMapping(value = "/boardFosrm.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getCompanyNm(@RequestParam("coName") String coName, HttpServletResponse response,
			HttpServletRequest request, ModelAndView mv) {
		List<Map<String, Object>> listMap = boardService.getCompanyNm(coName);
		return listMap; // Ajax로 넘겨줄 값 text, map, list
	}
}

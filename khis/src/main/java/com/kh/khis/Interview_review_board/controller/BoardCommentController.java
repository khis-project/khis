package com.kh.khis.Interview_review_board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.khis.Interview_review_board.model.service.BoardCommentService;
import com.kh.khis.Interview_review_board.model.service.BoardService;
import com.kh.khis.Interview_review_board.model.vo.BoardComment;
import com.kh.khis.login_join_mypage.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/boardComment")
public class BoardCommentController {

	@Autowired
	private BoardCommentService commentService;

	// 댓글 리스트
	@GetMapping("/commentList.do")
	public List<BoardComment> commentList(@RequestParam(defaultValue = "1") int cPage, @RequestParam int boardNo,
			HttpSession session) {

		Member loginMember = (Member) session.getAttribute("loginMember");
		int limit = 100;
		int offset = (cPage - 1) * limit;

		BoardComment comment = new BoardComment();
		comment.setBoardNo(boardNo);
		comment.setWriterNo(loginMember.getMemberNo());

		List<BoardComment> allList = commentService.selectCommentList(offset, limit, comment);
		log.debug("allList = {}", allList);
		System.out.println(allList);

		return allList;
	}

	// 댓글 수정(업데이트)
	@PostMapping("/commentUpdate.do")
	public Map<String, Object> commentUpdate(BoardComment comment, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<>();
		if (loginMember != null && comment.getWriterNo() == loginMember.getMemberNo()) {
			int result = commentService.updateComment(comment);
			map.put("success", result > 0);
		} else {
			map.put("success", false);
		}
		return map;
	}

	// 댓글 삭제
	@PostMapping("/deleteComment.do")
	public Map<String, Object> deleteComment(@RequestParam int commentNo, HttpSession session) throws Exception {
		System.out.println(commentNo);
		Member loginMember = (Member) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<>();
		BoardComment comment = commentService.selectOneComment(commentNo);
		if (comment != null && loginMember != null && comment.getWriterNo() == loginMember.getMemberNo()) {
			int result = commentService.deleteComment(commentNo);
			map.put("success", result > 0);
		} else {
			map.put("success", false);
		}
		return map;
	}

	// 댓글 내용 추가
	@PostMapping("/insertComment.do")
	public Map<String, Object> insertComment(BoardComment comment, HttpSession session) throws Exception {
		Member loginMember = (Member) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<>();
		if (loginMember == null) {
			map.put("message", "로그인이 필요합니다.");
			map.put("success", false);
		} else {
			comment.setWriterNo(loginMember.getMemberNo());
			int result = commentService.insertComment(comment);
			comment = commentService.selectOneComment(comment.getCommentNo());
			map.put("success", result > 0);
			map.put("commentDate", comment.getCommentDate());
			map.put("commentNo", comment.getCommentNo());
		}
		return map;
	}
}

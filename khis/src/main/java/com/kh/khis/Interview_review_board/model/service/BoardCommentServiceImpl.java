package com.kh.khis.Interview_review_board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.khis.Interview_review_board.model.dao.BoardCommentDao;
import com.kh.khis.Interview_review_board.model.vo.BoardComment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	private BoardCommentDao commentDao;

	@Override
	public int insertComment(BoardComment comment) {
		int result = 0;
		result = commentDao.insertComment(comment);
		log.debug("commentNo = {}", comment.getCommentNo());
		return result;
	}

	@Override
	public BoardComment selectOneComment(int commentNo) {
		return commentDao.selectOneComment(commentNo);
	}

	@Override
	public List<BoardComment> selectCommentList(int offset, int limit, BoardComment comment) {
		return commentDao.selectCommentList(offset, limit, comment);
	}

	@Override
	public int updateComment(BoardComment comment) {
		return commentDao.updateComment(comment);
	}

	@Override
	public int deleteComment(int commentNo) {
		return commentDao.deleteComment(commentNo);
	}
}

package com.kh.khis.Interview_review_board.model.service;

import java.util.List;

import com.kh.khis.Interview_review_board.model.vo.BoardComment;

public interface BoardCommentService {

	List<BoardComment> selectCommentList(int offset, int limit, BoardComment comment);

	int insertComment(BoardComment comment);

	int updateComment(BoardComment comment);

	int deleteComment(int commentNo);

	BoardComment selectOneComment(int commentNo);
}

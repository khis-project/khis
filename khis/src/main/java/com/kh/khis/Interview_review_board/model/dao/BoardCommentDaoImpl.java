package com.kh.khis.Interview_review_board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.Interview_review_board.model.vo.BoardComment;

@Repository
public class BoardCommentDaoImpl implements BoardCommentDao {

	@Autowired
	private SqlSession session;

	@Override
	public BoardComment selectOneComment(int commentNo) {
		return session.selectOne("comment.selectComment", commentNo);
	}

	@Override
	public List<BoardComment> selectCommentList(int offset, int limit, BoardComment comment) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("comment.selectCommentList", comment, rowBounds);
	}

	@Override
	public int insertComment(BoardComment comment) {
		return session.insert("comment.insertComment", comment);
	}

	@Override
	public int updateComment(BoardComment comment) {
		return session.update("comment.updateComment", comment);
	}

	@Override
	public int deleteComment(int commentNo) {
		return session.delete("comment.deleteComment", commentNo);
	}
}

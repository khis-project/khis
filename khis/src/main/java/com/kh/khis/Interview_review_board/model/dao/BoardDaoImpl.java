package com.kh.khis.Interview_review_board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.Interview_review_board.model.vo.Board;
import com.kh.khis.Interview_review_board.model.vo.BoardMemberCompany;
import com.kh.khis.Interview_review_board.model.vo.Occupation;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertBoard(Board board) {
		return session.insert("board.insertBoard", board);
	}

	@Override
	public List<Map<String,Object>> getCompanyNm(String coName) {
		return session.selectList("board.getCompanyNm", coName);
	}

	@Override
	public List<BoardMemberCompany> selectCompanyList() {
		
		return session.selectList("board.selectCompanyList");
	}

	@Override
	public int selectBoardTotalCount(String occupationCd) {
		Map<String,Object> mapParam = new HashMap<String, Object>();
		mapParam.put("occupation_code", occupationCd);
		return session.selectOne("board.selectBoardTotalCount",mapParam);
	}

	@Override
	public List<Occupation> selectBoardList(int offset, int limit, String occupationCd) {
		RowBounds rowBounds = new RowBounds(offset, limit); 
		return session.selectList("board.selectBoardList", occupationCd, rowBounds);
	}

	@Override
	public List<Map<String, Object>> selectDetailList(Map<String, Object> mapParam, int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("board.selectDetailList", mapParam, rowBounds);
	}

	@Override
	public int selectContentsTotalCount(String coCode, String occupationCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("coCode", coCode);
		map.put("occupationCode", occupationCode);
		return session.selectOne("board.selectContentsTotalCount", map);
	}

	@Override
	public List<Occupation> selectAllList(int offset, int limit, String occupationCd) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String,Object> mapParam = new HashMap<String, Object>();
		mapParam.put("occupation_code", occupationCd);
		return session.selectList("board.selectAllList", mapParam, rowBounds);
	}

	@Override
	public int selectinterViewAvg(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectinterViewAvg", mapParam);
	}

	@Override
	public List<Map<String, Object>> selectBoardDetailOne(int param) {
		// TODO Auto-generated method stub
		Map<String, Integer> mapParam = new HashMap<String,Integer>();
		mapParam.put("param", param);
		return session.selectList("board.selectBoardDetailOne", mapParam);
	}

	@Override
	public int updateBoard(Board board) {
		return session.update("board.updateBoard", board);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return session.delete("board.deleteBoard", boardNo);
	}


}

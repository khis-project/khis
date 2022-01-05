package com.kh.khis.Interview_review_board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.khis.Interview_review_board.model.dao.BoardDao;
import com.kh.khis.Interview_review_board.model.vo.Board;
import com.kh.khis.Interview_review_board.model.vo.BoardMemberCompany;
import com.kh.khis.Interview_review_board.model.vo.Occupation;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("boardService")
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public int insertBoard(Board board) {
		int result = 0;
		result = boardDao.insertBoard(board);
		log.debug("boardNo = {}", board.getBoardNo());
		return result;
	}

	@Override
	public List<Map<String,Object>> getCompanyNm(String coName) {
		return boardDao.getCompanyNm(coName); 
	
	}

	@Override
	public List<Occupation> selectBoardList(int offset, int limit, String occupationCd) {
		return boardDao.selectBoardList(offset, limit, occupationCd);
	}

	@Override
	public List<BoardMemberCompany> selectCompanyList() {
		return boardDao.selectCompanyList();
	}

	@Override
	public int selectBoardTotalCount(String occupationCd) {
		return boardDao.selectBoardTotalCount(occupationCd);
	}

	@Override
	public List<Map<String, Object>> selectDetailList(Map<String, Object> mapParam, int offset, int limit) {
		// TODO Auto-generated method stub
		return boardDao.selectDetailList(mapParam, offset, limit);
	}

	@Override
	public int selectContentsTotalCount(String coCode, String occupationCode) {
		return boardDao.selectContentsTotalCount(coCode, occupationCode);
	}

	@Override
	public List<Occupation> selectAllList(int offset, int limit, String occupationCd) {
		return boardDao.selectAllList(offset, limit, occupationCd);
	}

	@Override
	public int selectinterViewAvg(Map<String, Object> mapParam) {
		// TODO Auto-generated method stub
		return boardDao.selectinterViewAvg(mapParam);
	}

	@Override
	public List<Map<String, Object>> selectBoardDetailOne(int param) {
		// TODO Auto-generated method stub
		return boardDao.selectBoardDetailOne(param);
	}

	@Override
	public int updateBoard(Board board) {
		return boardDao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(boardNo);
	}


}

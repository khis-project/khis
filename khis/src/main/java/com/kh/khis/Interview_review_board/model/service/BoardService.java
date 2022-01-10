package com.kh.khis.Interview_review_board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.khis.Interview_review_board.model.vo.Board;
import com.kh.khis.Interview_review_board.model.vo.BoardMemberCompany;
import com.kh.khis.Interview_review_board.model.vo.Occupation;

public interface BoardService {

	List<Occupation> selectBoardList(int offset, int limit, String occupationCd);

	int insertBoard(Board board);

	List<Map<String,Object>> getCompanyNm(String coName);

	/* List<BoardMemberCompany> selectCompanyList(); */
	List<BoardMemberCompany> selectCompanyList(int member_info_no); 

	int selectBoardTotalCount(String occupationCd);

	List<Map<String, Object>> selectDetailList(Map<String, Object> mapParam, int offset, int limit);

	int selectContentsTotalCount(String coCode, String occupationCode);

	List<Occupation> selectAllList(int offset, int limit, String occupationCd);

	int selectinterViewAvg(Map<String, Object> mapParam);

	List<Map<String, Object>> selectBoardDetailOne(int param);

	int updateBoard(Board board);

	int deleteBoard(int boardNo);

	

}

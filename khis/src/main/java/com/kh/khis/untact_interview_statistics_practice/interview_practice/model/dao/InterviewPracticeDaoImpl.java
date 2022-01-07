package com.kh.khis.untact_interview_statistics_practice.interview_practice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Ir_info;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;


@Repository
public class InterviewPracticeDaoImpl implements InterviewPracticeDao{

	@Autowired
	private SqlSession session;



	@Override
	public List<InterviewQuesionPractice> selectPracticeList(Map<String, Object> param) {
		return session.selectList("InterviewPractice.selectPracticeList", param);
	}



	@Override
	public List<InterviewQuesionPractice> selectPracticeAdmin(int offset, int limit, Map<String,String> map) {
		RowBounds rowBounds = new RowBounds(offset, limit); 
		System.out.println("map : " + map);
		return session.selectList("InterviewPractice.selectPracticeAdmin",map,rowBounds);
	}



	@Override
	public int updatePracticeAdmin(int question_no) {
		return session.update("InterviewPractice.updatePracticeAdmin",question_no);
	}



	@Override
	public int insertInterviewePractice(InterviewQuesionPractice iqp) {
		return session.insert("InterviewPractice.insertInterviewePractice",iqp);
		
	}



	@Override
	public int selectAdminTotalCount(Map<String,String> map) {
		return session.selectOne("InterviewPractice.selectAdminTotalCount",map);
		
	}



	
}

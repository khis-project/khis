package com.kh.khis.interview_management.interview.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.interview_management.interview.model.vo.Interview;
import com.kh.khis.interview_management.irinfo.model.vo.IRInfo;

@Repository
public class InterviewDaoImpl implements InterviewDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Interview> selectInterviewList(int offset, int limit, long co_code) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("interview.selectInterviewList", co_code, rowBounds);
	}

	@Override
	public int insertInterview(Interview interview) {
		// TODO Auto-generated method stub
		return session.insert("interview.insertInterview", interview);
	}

	@Override
	public Interview selectOneInterview(int interviewNo) {
		// TODO Auto-generated method stub
		return session.selectOne("interview.selectOneInterview", interviewNo);
	}

	@Override
	public int updateInterview(Interview interview) {
		// TODO Auto-generated method stub
		return session.update("interview.updateInterview", interview);
	}

	@Override
	public int deleteInterview(int interviewNo) {
		// TODO Auto-generated method stub
		return session.delete("interview.deleteInterview", interviewNo);
	}

	@Override
	public int selectInterviewTotalCount(long co_code) {
		// TODO Auto-generated method stub
		return session.selectOne("interview.selectInterviewTotalCount",co_code);
	}

	@Override
	public List<IRInfo> selectInterviewerList(long coCode) {
		// TODO Auto-generated method stub
		return session.selectList("interview.selectInterviewerList", coCode);
	}
	
	
	
}

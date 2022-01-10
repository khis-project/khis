package com.kh.khis.interview_management.interview.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khis.interview_management.interview.model.dao.InterviewDao;
import com.kh.khis.interview_management.interview.model.vo.Interview;
import com.kh.khis.interview_management.irinfo.model.vo.IRInfo;

@Service
public class InterviewServiceImpl implements InterviewService {
	
	@Autowired
	private InterviewDao interviewDao;

	

	@Override
	public List<Interview> selectInterviewList(int offset, int limit, long co_code) {
		// TODO Auto-generated method stub
		return interviewDao.selectInterviewList(offset, limit, co_code);
	}

	@Override
	public int insertInterview(Interview interview) {
		return interviewDao.insertInterview(interview);
	}

	@Override
	public Interview selectOneInterview(int interviewNo) {
		// TODO Auto-generated method stub
		return interviewDao.selectOneInterview(interviewNo);
	}

	@Override
	public int updateInterview(Interview interview) {
		// TODO Auto-generated method stub
		return interviewDao.updateInterview(interview);
	}

	@Override
	public int deleteInterview(int interviewNo) {
		// TODO Auto-generated method stub
		return interviewDao.deleteInterview(interviewNo);
	}

	@Override
	public int selectInterviewTotalCount(long co_code) {
		// TODO Auto-generated method stub
		return interviewDao.selectInterviewTotalCount(co_code);
	}

	@Override
	public List<IRInfo> selectInterviewerList(long coCode) {
		// TODO Auto-generated method stub
		return interviewDao.selectInterviewerList(coCode);
	}
	
	
}

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
	public List<Interview> selectInterviewList(int offset, int limit) {
		// TODO Auto-generated method stub
		return interviewDao.selectInterviewList(offset, limit);
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
	public int selectInterviewTotalCount() {
		// TODO Auto-generated method stub
		return interviewDao.selectInterviewTotalCount();
	}

	@Override
	public List<IRInfo> selectInterviewerList(int memberNo) {
		// TODO Auto-generated method stub
		return interviewDao.selectInterviewerList(memberNo);
	}
	
	
}

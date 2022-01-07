package com.kh.khis.interview_management.interview.model.dao;

import java.util.List;

import com.kh.khis.interview_management.interview.model.vo.Interview;
import com.kh.khis.interview_management.irinfo.model.vo.IRInfo;

public interface InterviewDao {

	List<Interview> selectInterviewList(int offset, int limit);

	int insertInterview(Interview interview);

	Interview selectOneInterview(int interviewNo);

	int updateInterview(Interview interview);

	int deleteInterview(int interviewNo);

	int selectInterviewTotalCount();

	List<IRInfo> selectInterviewerList(int memberNo);

}

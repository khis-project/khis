package com.kh.khis.interview_management.interview.model.service;

import java.util.List;

import com.kh.khis.interview_management.interview.model.vo.Interview;
import com.kh.khis.interview_management.irinfo.model.vo.IRInfo;

public interface InterviewService {

	List<Interview> selectInterviewList(int offset, int limit, long co_code);

	int insertInterview(Interview interview);

	Interview selectOneInterview(int interviewNo);

	int updateInterview(Interview interview);

	int deleteInterview(int interviewNo);

	int selectInterviewTotalCount(long co_code);

	List<IRInfo> selectInterviewerList(long coCode);

}

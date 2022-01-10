package com.kh.khis.interview_management.irinfo.model.service;

import java.util.List;
import java.util.Map;

import com.kh.khis.interview_management.irinfo.model.vo.AssignedInfo;
import com.kh.khis.interview_management.irinfo.model.vo.IRInfo;
import com.kh.khis.interview_management.irinfo.model.vo.IRPath;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewTime;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerCareer;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerCertificate;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerInfo;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;


public interface IRInfoService {

	int insertInterviewer(IRInfo irInfo);

	int insertRater(IRInfo irInfo, String[] assignedInfoNo);

	List<IRInfo> selectInfoList(int offset, int limit, long co_code);

	IRInfo selectOneIRInfo(int memberInfoNo);

	int deleteIRInfo(int memberInfoNo);

	int selectIRInfoTotalCount(long co_code);

	List<Zoom> selectZoomList(int memberNo);

	List<IRInfo> selectInterviewerList(int memberNo);

	List<IRPath> selectIRPathList();

	List<String> selectInterviewerName(int memberInfoNo);

	InterviewTime selectOneInterviewTime(int memberInfoNo);

	int updateInterviewer(IRInfo irInfo);

	int updateRater(IRInfo irInfo, String[] memberNoList);

	int checkDuplicate(IRInfo irInfo);

	int insertInterviewerInfo(Map<String, Object> paramMap);

	InterviewerInfo selectOneInterviewerInfo(int interviewerInfoNo);

	List<InterviewerCareer> selectCareerList(int interviewerInfoNo);

	List<InterviewerCertificate> selectCertificateList(int interviewerInfoNo);

	IRInfo selectOneIRInfoByInterviewerInfoNo(int interviewerInfoNo);

	List<AssignedInfo> selectAssignedInfoList(int memberInfoNo);


}

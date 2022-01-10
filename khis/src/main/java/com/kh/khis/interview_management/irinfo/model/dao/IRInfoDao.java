package com.kh.khis.interview_management.irinfo.model.dao;

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

public interface IRInfoDao {


	int insertInterviewer(IRInfo irInfo);

	int insertRater(IRInfo irInfo);

	List<IRInfo> selectInfoList(int offset, int limit, long co_code);

	IRInfo selectOneIRInfo(int memberInfoNo);

	int deleteIRInfo(int memberInfoNo);

	int updateIRInfo(IRInfo irInfo);

	int selectIRInfoTotalCount(long co_code);

	List<Zoom> selectZoomList(int memberNo);

	List<IRInfo> selectInterviewerList(int memberNo);

	int insertAssignedInfo(AssignedInfo assignedInfo);

	List<IRPath> selectIRPathList();

	int insertInterviewTime(InterviewTime interviewTime);

	List<String> selectInterviewerName(int memberInfoNo);

	InterviewTime selectOnteInterviewTime(int memberInfoNo);

	int updateInterviewer(IRInfo irInfo);

	int updateInterviewTime(InterviewTime interviewTime);

	int updateRater(IRInfo irInfo);

	int updateAssignedInfo(AssignedInfo assignedInfo);

	int checkDuplicate(IRInfo irInfo);

	int insertInterviewerInfo(InterviewerInfo interviewerInfo);

	int insertInterviewerCareer(Map<String, Object> paramMap);

	int insertInterviewerCertificate(Map<String, Object> paramMap);

	InterviewerInfo selectOneInterviewerInfo(int interviewerInfoNo);

	List<InterviewerCareer> selectCareerList(int interviewerInfoNo);

	List<InterviewerCertificate> selectCertificateList(int interviewerInfoNo);

	IRInfo selectOneIRInfoByInterviewerInfoNo(int interviewerInfoNo);

	List<AssignedInfo> selectAssignedInfoList(int memberInfoNo);

	int deleteAssignedInfo(int assignedInfoNo);
	
	

}

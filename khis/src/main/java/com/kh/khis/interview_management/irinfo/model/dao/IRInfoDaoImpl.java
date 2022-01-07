package com.kh.khis.interview_management.irinfo.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.interview_management.irinfo.model.vo.AssignedInfo;
import com.kh.khis.interview_management.irinfo.model.vo.IRInfo;
import com.kh.khis.interview_management.irinfo.model.vo.IRPath;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewTime;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerCareer;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerCertificate;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerInfo;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;

@Repository
public class IRInfoDaoImpl implements IRInfoDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertInterviewer(IRInfo irInfo) {
		// TODO Auto-generated method stub
		return session.insert("irinfo.insertInterviewer", irInfo);
	}

	@Override
	public int insertRater(IRInfo irInfo) {
		// TODO Auto-generated method stub
		return session.insert("irinfo.insertRater", irInfo);
	}

	

	@Override
	public List<IRInfo> selectInfoList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("irinfo.selectInfoList",null, rowBounds);
	}

	@Override
	public IRInfo selectOneIRInfo(int memberInfoNo) {
		// TODO Auto-generated method stub
		return session.selectOne("irinfo.selectOneIRInfo", memberInfoNo);
	}

	@Override
	public int deleteIRInfo(int memberInfoNo) {
		// TODO Auto-generated method stub
		return session.delete("irinfo.deleteIRInfo", memberInfoNo);
	}

	@Override
	public int updateIRInfo(IRInfo irInfo) {
		// TODO Auto-generated method stub
		return session.update("irinfo.updateIRInfo", irInfo);
	}

	@Override
	public int selectIRInfoTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("irinfo.selectIRInfoTotalCount");
	}

	@Override
	public List<Zoom> selectZoomList(int memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("irinfo.selectZoomList", memberNo);
	}

	@Override
	public List<IRInfo> selectInterviewerList(int memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("irinfo.selectInterviewerList", memberNo);
	}

	@Override
	public int insertAssignedInfo(AssignedInfo assignedInfo) {
		// TODO Auto-generated method stub
		return session.insert("irinfo.insertAssignedInfo", assignedInfo);
	}

	@Override
	public List<IRPath> selectIRPathList() {
		// TODO Auto-generated method stub
		return session.selectList("irinfo.selectIRPathList");
	}

	@Override
	public int insertInterviewTime(InterviewTime interviewTime) {
		// TODO Auto-generated method stub
		return session.insert("irinfo.insertInterviewTime", interviewTime);
	}

	@Override
	public List<String> selectInterviewerName(int memberInfoNo) {
		// TODO Auto-generated method stub
		return session.selectList("irinfo.selectInterviewerName", memberInfoNo);
	}

	@Override
	public InterviewTime selectOnteInterviewTime(int memberInfoNo) {
		// TODO Auto-generated method stub
		return session.selectOne("irinfo.selectOneInterviewTime", memberInfoNo);
	}

	@Override
	public int updateInterviewer(IRInfo irInfo) {
		// TODO Auto-generated method stub
		return session.update("irinfo.updateInterviewer", irInfo);
	}

	@Override
	public int updateInterviewTime(InterviewTime interviewTime) {
		// TODO Auto-generated method stub
		return session.update("irinfo.updateInterviewTime", interviewTime);
	}

	

	@Override
	public List<AssignedInfo> selectAssignedInfoList(int memberInfoNo) {
		// TODO Auto-generated method stub
		return session.selectList("irinfo.selectAssignedInfoList", memberInfoNo);
	}

	@Override
	public int updateRater(IRInfo irInfo) {
		// TODO Auto-generated method stub
		return session.update("irinfo.updateRater", irInfo);
	}

	@Override
	public int updateAssignedInfo(AssignedInfo assignedInfo) {
		// TODO Auto-generated method stub
		return session.update("irinfo.updateAssignedInfo", assignedInfo);
	}

	@Override
	public int checkDuplicate(IRInfo irInfo) {
		// TODO Auto-generated method stub
		return session.selectOne("irinfo.checkDuplicate", irInfo);
	}

	@Override
	public int insertInterviewerInfo(InterviewerInfo interviewerInfo) {
		// TODO Auto-generated method stub
		return session.insert("irinfo.insertInterviewerInfo", interviewerInfo);
	}

	@Override
	public int insertInterviewerCareer(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return session.insert("irinfo.insertInterviewerCareer", paramMap);
	}

	@Override
	public int insertInterviewerCertificate(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return session.insert("irinfo.insertInterviewerCertificate", paramMap);
	}

	@Override
	public InterviewerInfo selectOneInterviewerInfo(int interviewerInfoNo) {
		// TODO Auto-generated method stub
		return session.selectOne("irinfo.selectOneInterviewerInfo", interviewerInfoNo);
	}

	@Override
	public List<InterviewerCareer> selectCareerList(int interviewerInfoNo) {
		// TODO Auto-generated method stub
		return session.selectList("irinfo.selectCareerList", interviewerInfoNo);
	}

	@Override
	public List<InterviewerCertificate> selectCertificateList(int interviewerInfoNo) {
		// TODO Auto-generated method stub
		return session.selectList("irinfo.selectCertificateList", interviewerInfoNo);
	}

	@Override
	public IRInfo selectOneIRInfoByInterviewerInfoNo(int interviewerInfoNo) {
		// TODO Auto-generated method stub
		return session.selectOne("irinfo.selectOneIRInfoByInterviewerInfoNo", interviewerInfoNo);
	}

	@Override
	public int deleteAssignedInfo(int assignedInfoNo) {
		// TODO Auto-generated method stub
		return session.delete("irinfo.deleteAssignedInfo", assignedInfoNo);
	}


	
	
}

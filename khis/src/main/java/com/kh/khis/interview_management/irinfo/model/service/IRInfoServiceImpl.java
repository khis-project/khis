package com.kh.khis.interview_management.irinfo.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.khis.interview_management.irinfo.model.dao.IRInfoDao;
import com.kh.khis.interview_management.irinfo.model.vo.AssignedInfo;
import com.kh.khis.interview_management.irinfo.model.vo.IRInfo;
import com.kh.khis.interview_management.irinfo.model.vo.IRPath;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewTime;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerCareer;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerCertificate;
import com.kh.khis.interview_management.irinfo.model.vo.InterviewerInfo;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class IRInfoServiceImpl implements IRInfoService {

	@Autowired
	private IRInfoDao irinfoDao;


	@Override
	@Transactional(
			propagation = Propagation.REQUIRED,
			isolation = Isolation.READ_COMMITTED,
			rollbackFor = Exception.class
			)
	public int insertInterviewer(IRInfo irInfo) {
		int result = 0;
		
		try {
			result = irinfoDao.insertInterviewer(irInfo);
			log.debug("irInfo.memberInfoNo = {}", irInfo.getMemberInfoNo());
			
			InterviewTime interviewTime = irInfo.getInterviewTime();
			if(interviewTime != null) {
				interviewTime.setMemberInfoNo(irInfo.getMemberInfoNo());
				result = irinfoDao.insertInterviewTime(interviewTime);
			}
		} catch (Exception e) {
			log.error("면접관 등록 오류", e);
			throw e;
		}
		return result;
	}


	@Override
	@Transactional(
			propagation = Propagation.REQUIRED,
			isolation = Isolation.READ_COMMITTED,
			rollbackFor = Exception.class
			)
	public int insertRater(IRInfo irInfo, String[] memberNoList) {
		int result = 0;
		
		try {
			result = irinfoDao.insertRater(irInfo);
			log.debug("irInfo.memberInfoNo = {}", irInfo.getMemberInfoNo());
			
			for(String str : memberNoList) {
				AssignedInfo assignedInfo = new AssignedInfo();
				int memberInfNo = Integer.parseInt(str);
				assignedInfo.setAssignedInterviewer(irInfo.getMemberInfoNo());
				assignedInfo.setMemberInfoNo(memberInfNo);
				
				result = irinfoDao.insertAssignedInfo(assignedInfo);
				
			}
		} catch (Exception e) {
			log.error("면접관 등록 오류", e);
			throw e;
		}
		return result;
	}

	@Override
	public List<IRInfo> selectInfoList(int offset, int limit, long co_code) {
		// TODO Auto-generated method stub
		return irinfoDao.selectInfoList(offset, limit, co_code);
	}


	@Override
	public IRInfo selectOneIRInfo(int memberInfoNo) {
		// TODO Auto-generated method stub
		return irinfoDao.selectOneIRInfo(memberInfoNo);
	}


	@Override
	public int deleteIRInfo(int memberInfoNo) {
		// TODO Auto-generated method stub
		return irinfoDao.deleteIRInfo(memberInfoNo);
	}

	@Override
	public int selectIRInfoTotalCount(long co_code) {
		// TODO Auto-generated method stub
		return irinfoDao.selectIRInfoTotalCount(co_code);
	}


	@Override
	public List<Zoom> selectZoomList(int memberNo) {
		// TODO Auto-generated method stub
		return irinfoDao.selectZoomList(memberNo);
	}


	@Override
	public List<IRInfo> selectInterviewerList(int memberNo) {
		// TODO Auto-generated method stub
		return irinfoDao.selectInterviewerList(memberNo);
	}


	@Override
	public List<IRPath> selectIRPathList() {
		// TODO Auto-generated method stub
		return irinfoDao.selectIRPathList();
	}


	@Override
	public List<String> selectInterviewerName(int memberInfoNo) {
		// TODO Auto-generated method stub
		return irinfoDao.selectInterviewerName(memberInfoNo);
	}


	@Override
	public InterviewTime selectOneInterviewTime(int memberInfoNo) {
		// TODO Auto-generated method stub
		return irinfoDao.selectOnteInterviewTime(memberInfoNo);
	}



	@Override
	@Transactional(
			propagation = Propagation.REQUIRED,
			isolation = Isolation.READ_COMMITTED,
			rollbackFor = Exception.class
			)
	public int updateInterviewer(IRInfo irInfo) {
		int result = 0;

		try {
			result = irinfoDao.updateInterviewer(irInfo);

			InterviewTime interviewTime = irInfo.getInterviewTime();
			if (interviewTime != null) {
				interviewTime.setMemberInfoNo(irInfo.getMemberInfoNo());
				result = irinfoDao.updateInterviewTime(interviewTime);
			}
		} catch (Exception e) {
			log.error("면접관 등록 오류", e);
			throw e;
		}
		return result;
	}



	@Override
	public List<AssignedInfo> selectAssignedInfoList(int memberInfoNo) {
		// TODO Auto-generated method stub
		return irinfoDao.selectAssignedInfoList(memberInfoNo);
	}


	@Transactional(
			propagation = Propagation.REQUIRED,
			isolation = Isolation.READ_COMMITTED,
			rollbackFor = Exception.class
			)
	@Override
	public int updateRater(IRInfo irInfo, String[] memberNoList) {
		int result = 0;
		
		try {
			result = irinfoDao.updateRater(irInfo);
			log.debug("irInfo.memberInfoNo = {}", irInfo.getMemberInfoNo());
			int assignedInfoNo = irInfo.getMemberInfoNo();
			
			result = irinfoDao.deleteAssignedInfo(assignedInfoNo);
			
			for(String str : memberNoList) {
				AssignedInfo assignedInfo = new AssignedInfo();
				int memberInfNo = Integer.parseInt(str);
				assignedInfo.setAssignedInterviewer(assignedInfoNo);
				assignedInfo.setMemberInfoNo(memberInfNo);
				
				result = irinfoDao.insertAssignedInfo(assignedInfo);
				
			}
		} catch (Exception e) {
			log.error("면접관 등록 오류", e);
			throw e;
		}
		return result;
	}

	@Override
	public int checkDuplicate(IRInfo irInfo) {
		// TODO Auto-generated method stub
		return irinfoDao.checkDuplicate(irInfo);
	}


	@Override
	@Transactional(
			propagation = Propagation.REQUIRED,
			isolation = Isolation.READ_COMMITTED,
			rollbackFor = Exception.class
			)
	public int insertInterviewerInfo(Map<String, Object> paramMap) {
		int result = 0;
		
		InterviewerInfo interviewerInfo = (InterviewerInfo) paramMap.get("interviewerInfo");
		result = irinfoDao.insertInterviewerInfo(interviewerInfo);
		log.debug("result@insertInterviewerInfo = {}", result);
		int interviewerInfoNo = interviewerInfo.getInterviewerInfoNo();
		
		paramMap.put("interviewerInfoNo", interviewerInfoNo);
		
		result = irinfoDao.insertInterviewerCareer(paramMap);
		log.debug("result@insertInterviewerCareer = {}", result);
		
		result = irinfoDao.insertInterviewerCertificate(paramMap);
		log.debug("result@insertInterviewerCertificate = {}", result);

		return result;
	}


	@Override
	public InterviewerInfo selectOneInterviewerInfo(int interviewerInfoNo) {
		// TODO Auto-generated method stub
		return irinfoDao.selectOneInterviewerInfo(interviewerInfoNo);
	}



	@Override
	public List<InterviewerCareer> selectCareerList(int interviewerInfoNo) {
		// TODO Auto-generated method stub
		return irinfoDao.selectCareerList(interviewerInfoNo);
	}


	@Override
	public List<InterviewerCertificate> selectCertificateList(int interviewerInfoNo) {
		// TODO Auto-generated method stub
		return irinfoDao.selectCertificateList(interviewerInfoNo);
	}


	@Override
	public IRInfo selectOneIRInfoByInterviewerInfoNo(int interviewerInfoNo) {
		// TODO Auto-generated method stub
		return irinfoDao.selectOneIRInfoByInterviewerInfoNo(interviewerInfoNo);
	}
	
	
}

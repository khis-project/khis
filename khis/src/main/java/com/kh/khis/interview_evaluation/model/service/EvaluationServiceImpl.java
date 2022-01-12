package com.kh.khis.interview_evaluation.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khis.interview_evaluation.model.dao.EvaluationDao;
import com.kh.khis.interview_evaluation.model.vo.Apply;
import com.kh.khis.interview_evaluation.model.vo.Assigned;
import com.kh.khis.interview_evaluation.model.vo.Career;
import com.kh.khis.interview_evaluation.model.vo.Certificate;
import com.kh.khis.interview_evaluation.model.vo.Evaluation;
import com.kh.khis.interview_evaluation.model.vo.Interviews;
import com.kh.khis.interview_evaluation.model.vo.Interviewer;
import com.kh.khis.interview_evaluation.model.vo.PassOrNonPass;
import com.kh.khis.interview_evaluation.model.vo.PassYN;

@Service
public class EvaluationServiceImpl implements EvaluationService {

	@Autowired
	private EvaluationDao evaluationDao;
	
	@Override
	public List<Interviewer> selectMemberList(int offset, int limit, int assigned_interviewer) {
		return evaluationDao.selectMemberList(offset, limit, assigned_interviewer);
	}

	@Override
	public int selectMemberCount(int assigned_interviewer) {
		return evaluationDao.selectMemberCount(assigned_interviewer);
	}

	@Override
	public Interviewer selectOneMember(int member_no) {
		return evaluationDao.selectOneMember(member_no);
	}

	@Override
	public List<Certificate> selectOneCertificate(int interviewer_info_no) {
		return evaluationDao.selectOneCertificate(interviewer_info_no);
	}

	@Override
	public List<Career> selectCareerList(int interviewer_info_no) {
		return evaluationDao.selectCareerList(interviewer_info_no);
	}

	@Override
	public List<Interviews> selectQuestionList(Map<String, Object> param) {
		return evaluationDao.selectQuestionList(param);
	}

	@Override
	public int insertEvaluation(Evaluation evaluation) {
		return evaluationDao.insertEvaluation(evaluation);
	}

	@Override
	public int updateEvaluation(Evaluation evaluation) {
		return evaluationDao.updateEvaluation(evaluation);
	}

	@Override
	public List<Apply> selectApplyList(Map<String, Object> param) {
		return evaluationDao.selectApplyList(param);
	}

	@Override
	public List<Interviews> selectOtherInterviewerEvaluation(String imember_info_no) {
		return evaluationDao.selectOtherInterviewerEvaluation(imember_info_no);
	}

	@Override
	public List<Assigned> selectAssignedList(Map<String, Integer> param) {
		return evaluationDao.selectAssignedList(param);
	}

	@Override
	public int calculateSumValue(Map<String, Object> param) {
		return evaluationDao.calculateSumValue(param);
	}

	@Override
	public int passnonpass(PassOrNonPass pass) {
		return evaluationDao.passnonpass(pass);
	}

	@Override
	public List<Interviewer> selectInterviewerList(int limit, int offset, long co_code) {
		return evaluationDao.selectInterviewerList(limit, offset, co_code);
	}

	@Override
	public int selectInterviewerCount(long co_code) {
		return evaluationDao.selectInterviewerCount(co_code);
	}

	@Override
	public List<Assigned> selectInterviewerDetail(Map<String, Object> param) {
		return evaluationDao.selectInterviewerDetail(param);
	}

	@Override
	public int insertPassYn(PassYN pass) {
		return evaluationDao.insertPassYn(pass);
	}

	@Override
	public List<Interviews> selectEvaluationList(Map<String, Object> param) {
		return evaluationDao.selectEvaluationList(param);
	}

	@Override
	public int selectEvaluateNo(Map<String, Object> param) {
		return evaluationDao.selectEvaluateNo(param);
	}


}

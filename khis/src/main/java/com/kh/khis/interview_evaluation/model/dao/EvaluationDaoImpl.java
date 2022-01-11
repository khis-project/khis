package com.kh.khis.interview_evaluation.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.interview_evaluation.model.vo.Apply;
import com.kh.khis.interview_evaluation.model.vo.Assigned;
import com.kh.khis.interview_evaluation.model.vo.Career;
import com.kh.khis.interview_evaluation.model.vo.Certificate;
import com.kh.khis.interview_evaluation.model.vo.Evaluation;
import com.kh.khis.interview_evaluation.model.vo.Interviews;
import com.kh.khis.interview_evaluation.model.vo.Interviewer;
import com.kh.khis.interview_evaluation.model.vo.PassOrNonPass;
import com.kh.khis.interview_evaluation.model.vo.PassYN;

@Repository
public class EvaluationDaoImpl implements EvaluationDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Interviewer> selectMemberList(int offset, int limit, int assigned_interviewer) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("evaluation.selectMemberList", assigned_interviewer, rowBounds);
	}

	@Override
	public int selectMemberCount(int assigned_interviewer) {
		return session.selectOne("evaluation.selectMemberCount", assigned_interviewer);
	}

	@Override
	public Interviewer selectOneMember(int member_no) {
		return session.selectOne("evaluation.selectOneMember", member_no);
	}

	@Override
	public List<Certificate> selectOneCertificate(int interviewer_info_no) {
		System.out.println("interviewer_info_no2 = " + interviewer_info_no);
		return session.selectList("evaluation.selectOneCertificate", interviewer_info_no);
	}

	@Override
	public List<Career> selectCareerList(int interviewer_info_no) {
		return session.selectList("evaluation.selectCareerList", interviewer_info_no);
	}

	@Override
	public List<Interviews> selectQuestionList(Map<String, Object> param) {
//		int member_no = Integer.parseInt(member);
		return session.selectList("evaluation.selectQuestionList2", param);
	}

	@Override
	public int insertEvaluation(Evaluation evaluation) {
		return session.insert("evaluation.insertEvaluation", evaluation);
	}

	@Override
	public int updateEvaluation(Evaluation evaluation) {
		return session.update("evaluation.updateEvaluation", evaluation);
	}

	@Override
	public List<Apply> selectApplyList(Map<String, Integer> param) {
		return session.selectList("evaluation.selectApplyList", param);
	}

	@Override
	public List<Interviews> selectOtherInterviewerEvaluation(String imember_info_no) {
		int member_no = Integer.parseInt(imember_info_no);
		return session.selectList("evaluation.selectOtherInterviewerEvaluation", member_no);
	}

	@Override
	public List<Assigned> selectAssignedList(Map<String, Integer> param) {
		return session.selectList("evaluation.selectAssignedList", param);
	}

	@Override
	public int calculateSumValue(Map<String, Object> param) {
		return session.selectOne("evaluation.calculateSumValue", param);
	}

	@Override
	public int passnonpass(PassOrNonPass pass) {
		return session.insert("evaluation.passnonpass", pass);
	}

	@Override
	public List<Interviewer> selectInterviewerList(int limit, int offset, long co_code) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("evaluation.selectInterviewerList", co_code, rowBounds);
	}

	@Override
	public int selectInterviewerCount(long co_code) {
		return session.selectOne("evaluation.selectInterviewerCount", co_code);
	}

	@Override
	public List<Assigned> selectInterviewerDetail(Map<String, Object> param) {
		return session.selectList("evaluation.selectInterviewerDetail", param);
	}

	@Override
	public int insertPassYn(PassYN pass) {
		return session.insert("evaluation.insertPassYn", pass);
	}

	@Override
	public List<Interviews> selectEvaluationList(Map<String, Object> param) {
		return session.selectList("evaluation.selectEvaluationList", param);
	}

}

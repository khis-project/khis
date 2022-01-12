package com.kh.khis.interview_evaluation.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.khis.interview_evaluation.model.vo.Apply;
import com.kh.khis.interview_evaluation.model.vo.Assigned;
import com.kh.khis.interview_evaluation.model.vo.Career;
import com.kh.khis.interview_evaluation.model.vo.Certificate;
import com.kh.khis.interview_evaluation.model.vo.Evaluation;
import com.kh.khis.interview_evaluation.model.vo.Interviews;
import com.kh.khis.interview_evaluation.model.vo.Interviewer;
import com.kh.khis.interview_evaluation.model.vo.PassOrNonPass;
import com.kh.khis.interview_evaluation.model.vo.PassYN;

public interface EvaluationDao {

	List<Interviewer> selectMemberList(int offset, int limit, int assigned_interviewer);

	int selectMemberCount(int assigned_interviewer);

	Interviewer selectOneMember(int member_no);

	List<Certificate> selectOneCertificate(int interviewer_info_no);

	List<Career> selectCareerList(int interviewer_info_no);

	List<Interviews> selectQuestionList(Map<String, Object> param);

	int insertEvaluation(Evaluation evaluation);

	int updateEvaluation(Evaluation evaluation);

	List<Apply> selectApplyList(Map<String, Object> param);

	List<Interviews> selectOtherInterviewerEvaluation(String imember_info_no);

	List<Assigned> selectAssignedList(Map<String, Integer> param);

	int calculateSumValue(Map<String, Object> param);

	int passnonpass(PassOrNonPass pass);

	List<Interviewer> selectInterviewerList(int limit, int offset, long co_code);

	int selectInterviewerCount(long co_code);

	List<Assigned> selectInterviewerDetail(Map<String, Object> param);

	int insertPassYn(PassYN pass);

	List<Interviews> selectEvaluationList(Map<String, Object> param);

	int selectEvaluateNo(Map<String, Object> param);

}

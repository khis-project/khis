package com.kh.khis.interview_evaluation.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.interview_evaluation.model.vo.Detail;
import com.kh.khis.interview_evaluation.model.vo.Interviewer;
import com.kh.khis.interview_evaluation.model.vo.Results;

@Repository
public class CheckMyEvaluationDaoImpl implements CheckMyEvaluationDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Results> selectResults(int member_no) {
		return session.selectList("checkMyEvaluation.selectResults", member_no);
	}

	@Override
	public List<Detail> selectInfoDetail(int member_info_no) {
		return session.selectList("checkMyEvaluation.selectInfoDetail", member_info_no);
	}
}

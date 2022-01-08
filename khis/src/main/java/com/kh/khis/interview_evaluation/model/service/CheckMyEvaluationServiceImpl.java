package com.kh.khis.interview_evaluation.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khis.interview_evaluation.model.dao.CheckMyEvaluationDao;
import com.kh.khis.interview_evaluation.model.vo.Detail;
import com.kh.khis.interview_evaluation.model.vo.Interviewer;
import com.kh.khis.interview_evaluation.model.vo.Results;

@Service
public class CheckMyEvaluationServiceImpl implements CheckMyEvaluationService {

	@Autowired
	private CheckMyEvaluationDao checkMyEvaluationdao;

	@Override
	public List<Results> selectResults(int member_no) {
		return checkMyEvaluationdao.selectResults(member_no);
	}

	@Override
	public List<Detail> selectInfoDetail(int member_info_no) {
		return checkMyEvaluationdao.selectInfoDetail(member_info_no);
	}


}

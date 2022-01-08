package com.kh.khis.interview_evaluation.model.dao;

import java.util.List;

import com.kh.khis.interview_evaluation.model.vo.Detail;
import com.kh.khis.interview_evaluation.model.vo.Results;

public interface CheckMyEvaluationDao {

	List<Results> selectResults(int member_no);

	List<Detail> selectInfoDetail(int member_info_no);

}

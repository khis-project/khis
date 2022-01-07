package com.kh.khis.untact_interview_statistics_practice.statistics.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;
import com.kh.khis.untact_interview_statistics_practice.statistics.model.vo.Statistics;


public interface StatisticsDao {

	public List<Statistics> selectStatisticsKind(String satisticsKind);

	public List<Statistics> selectStatisticsKind(Map<String, String> map);

}

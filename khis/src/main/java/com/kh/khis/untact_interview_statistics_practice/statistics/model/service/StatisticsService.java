package com.kh.khis.untact_interview_statistics_practice.statistics.model.service;

import java.util.List;
import java.util.Map;

import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;
import com.kh.khis.untact_interview_statistics_practice.statistics.model.vo.Statistics;


public interface StatisticsService {

	//List<InterviewQuesionPractice> selectPracticeList(String kind, String questions);

	public List<Statistics> selectStatisticsKind(String satisticsKind);

	public List<Statistics> selectStatisticsKind(Map<String, String> map);


}

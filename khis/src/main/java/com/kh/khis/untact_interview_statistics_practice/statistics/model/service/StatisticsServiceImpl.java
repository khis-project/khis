package com.kh.khis.untact_interview_statistics_practice.
statistics.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.dao.InterviewPracticeDao;
import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;
import com.kh.khis.untact_interview_statistics_practice.statistics.model.dao.StatisticsDao;
import com.kh.khis.untact_interview_statistics_practice.statistics.model.vo.Statistics;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("StatisticsService")
@Transactional
public class StatisticsServiceImpl implements StatisticsService {

	@Autowired
	private StatisticsDao statisticsDao;


	/*
	 * @Override public List<InterviewQuesionPractice> selectPracticeList(String
	 * kind, String questions) { return
	 * interviewPracticeDao.selectPracticeList(kind,questions); }
	 */


	@Override
	public List<Statistics> selectStatisticsKind(String satisticsKind) {
		return statisticsDao.selectStatisticsKind(satisticsKind);
	}

	public List<Statistics> selectStatisticsKind(Map<String,String> map) {
		return statisticsDao.selectStatisticsKind(map);
	}
	
}

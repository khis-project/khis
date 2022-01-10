package com.kh.khis.untact_interview_statistics_practice.premium.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.dao.InterviewPracticeDao;
import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;
import com.kh.khis.untact_interview_statistics_practice.premium.model.dao.PremiumDao;
import com.kh.khis.untact_interview_statistics_practice.premium.model.vo.Premium;
import com.kh.khis.untact_interview_statistics_practice.statistics.model.dao.StatisticsDao;
import com.kh.khis.untact_interview_statistics_practice.statistics.model.vo.Statistics;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("PremiumService")
@Transactional
public class PremiumServiceImpl implements PremiumService {

	@Autowired
	private PremiumDao premiumDao;


	@Override
	public int insertPremium(Map<String, Object> map) {
		return premiumDao.insertPremium(map);
	}


	@Override
	public Premium selectPremium(int member_no) {
		return premiumDao.selectPremium(member_no);
	}
	
}

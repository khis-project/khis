package com.kh.khis.untact_interview_statistics_practice.premium.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;
import com.kh.khis.untact_interview_statistics_practice.premium.model.vo.Premium;
import com.kh.khis.untact_interview_statistics_practice.statistics.model.vo.Statistics;


public interface PremiumDao {

	public int insertPremium(Map<String, Object> map);

	public Premium selectPremium(int member_no);

}

package com.kh.khis.untact_interview_statistics_practice.statistics.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;
import com.kh.khis.untact_interview_statistics_practice.statistics.model.vo.Statistics;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Ir_info;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;


@Repository
public class StatisticsDaoImpl implements StatisticsDao{

	@Autowired
	private SqlSession session;

	@Override
	public List<Statistics> selectStatisticsKind(String satisticsKind) {
		return session.selectList("Statistics.selectStatisticsKind", satisticsKind);
	}

	@Override
	public List<Statistics> selectStatisticsKind(Map<String, String> map) {
		return session.selectList("Statistics.selectStatisticsKind", map);
		
	}


	
}

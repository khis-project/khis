package com.kh.khis.untact_interview_statistics_practice.premium.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;
import com.kh.khis.untact_interview_statistics_practice.premium.model.vo.Premium;
import com.kh.khis.untact_interview_statistics_practice.statistics.model.vo.Statistics;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Ir_info;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;


@Repository
public class PremiumDaoImpl implements PremiumDao{

	@Autowired
	private SqlSession session;


	@Override
	public int insertPremium(Map<String, Object> map) {
		return session.insert("Premium.insertPremium", map);
		
	}


	@Override
	public Premium selectPremium(int member_no) {
		return session.selectOne("Premium.selectPremium", member_no);
	}
	
}

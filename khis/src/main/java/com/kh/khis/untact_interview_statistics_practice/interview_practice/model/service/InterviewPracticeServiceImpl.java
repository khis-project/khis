package com.kh.khis.untact_interview_statistics_practice.interview_practice.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.dao.InterviewPracticeDao;
import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("InterviewPracticeService")
@Transactional
public class InterviewPracticeServiceImpl implements InterviewPracticeService {

	@Autowired
	private InterviewPracticeDao interviewPracticeDao;


	/*
	 * @Override public List<InterviewQuesionPractice> selectPracticeList(String
	 * kind, String questions) { return
	 * interviewPracticeDao.selectPracticeList(kind,questions); }
	 */

	public List<InterviewQuesionPractice> selectPracticeList(Map<String, Object> param) {
		return interviewPracticeDao.selectPracticeList(param);
	}


	@Override
	public List<InterviewQuesionPractice> selectPracticeAdmin(int offset, int limit, Map<String,String> map) {
		return interviewPracticeDao.selectPracticeAdmin(offset,limit, map);
	}


	@Override
	public int updatePracticeAdmin(int question_no) {
		return interviewPracticeDao.updatePracticeAdmin(question_no);
	}


	@Override
	public int insertInterviewePractice(InterviewQuesionPractice iqp) {
		return interviewPracticeDao.insertInterviewePractice(iqp);
	}


	@Override
	public int selectAdminTotalCount(Map<String,String> map) {
		return interviewPracticeDao.selectAdminTotalCount(map);
	}
	
}

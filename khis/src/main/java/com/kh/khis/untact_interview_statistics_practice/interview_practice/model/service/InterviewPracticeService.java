package com.kh.khis.untact_interview_statistics_practice.interview_practice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo.InterviewQuesionPractice;


public interface InterviewPracticeService {

	//List<InterviewQuesionPractice> selectPracticeList(String kind, String questions);


	public List<InterviewQuesionPractice> selectPracticeList(Map<String, Object> param);

	public List<InterviewQuesionPractice> selectPracticeAdmin(int offset, int limit, Map<String,String> map);

	public int updatePracticeAdmin(int question_no);

	public int insertInterviewePractice(InterviewQuesionPractice iqp);

	public int selectAdminTotalCount(Map<String,String> map);


}

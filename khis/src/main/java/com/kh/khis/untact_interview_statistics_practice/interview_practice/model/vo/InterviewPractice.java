package com.kh.khis.untact_interview_statistics_practice.interview_practice.model.vo;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = false)
public class InterviewPractice implements Serializable {
	
	private static final long serialVersionUID = 1L;
	String interviewQ;
	List<String> interviewK;
	String interviewA;
	

}

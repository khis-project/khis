package com.kh.khis.interview_management.irinfo.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class InterviewerCareer {
	private int careerNo;
	private int interviewerInfoNo;
	private String[] companyName;
	private String[] careerTerm;
	private String[] careerStartTime;
	private String[] careerEndTime;
	
}

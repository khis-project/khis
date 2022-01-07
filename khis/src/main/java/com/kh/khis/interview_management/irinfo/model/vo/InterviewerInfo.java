package com.kh.khis.interview_management.irinfo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class InterviewerInfo {
	
	private int interviewerInfoNo;
	private String selfIntroduction;
	private String image;
	
	private InterviewerCareer interviewerCareer;
	private InterviewerCertificate interviewerCertificate;
}

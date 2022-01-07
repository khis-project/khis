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
public class InterviewerCertificate {

	private int certificateNo;
	private int interviewerInfoNo;
	private String[] certificateName;
	private String[] certificateIssuer;
	private String[] certificateDate;
}

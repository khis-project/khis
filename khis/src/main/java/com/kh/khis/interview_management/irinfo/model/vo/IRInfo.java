package com.kh.khis.interview_management.irinfo.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IRInfo {
	private int memberInfoNo;
	private int memberNo;
	private long coCode;
	private long interviewerNo;
	private String name;
	private String email;
	private String phone;
	private String category;
	private String role;
	private int zoomNo;
	private String irPathCode;
	private int interviewerInfoNo;
	private String ssn;
	private int memberIrHaedNo;
	
//	private String[] assignedInfoNo;
	
	private AssignedInfo assignedInfo;
	private InterviewTime interviewTime;
}

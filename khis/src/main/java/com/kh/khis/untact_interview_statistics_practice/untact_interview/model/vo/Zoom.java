package com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo;

import java.io.Serializable;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = false)
public class Zoom implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int zoom_no;
	private int member_no;
	private long co_code;
	private String api_key;
	private String api_secret;
	private String zoom_number; // 회의실번호
	private String zoom_password; // 회의실 패스웓드
	private String name;
	private String role;
	private String interviewer_no;
	

}

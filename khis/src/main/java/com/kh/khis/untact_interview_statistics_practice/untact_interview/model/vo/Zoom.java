package com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo;

import java.io.Serializable;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Zoom implements Serializable {
	
	private static final long serialVersionUID = 1L;
	int zoom_no;
	int member_no;
	int co_code;
	String api_key;
	String api_secret;
	String jwt_token;

}

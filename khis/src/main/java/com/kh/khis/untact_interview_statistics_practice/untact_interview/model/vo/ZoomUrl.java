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
public class ZoomUrl implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String name;
	private String mn;
	private String email;
	private String pwd;
	private String role;
	private String lang;
	private String signature;
	private String china;
	private String apiKey;

	

}

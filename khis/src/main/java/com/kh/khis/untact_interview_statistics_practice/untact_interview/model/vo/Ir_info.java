package com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Ir_info extends Zoom implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int member_info_no;
	private int member_no;
	private long co_code;
	private int interviewer_no;
	private String name;
	private String phone;
	private String category;
	private String role;
	private int ir_path_code;

	
	
}

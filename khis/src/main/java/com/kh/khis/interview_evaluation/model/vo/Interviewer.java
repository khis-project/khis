package com.kh.khis.interview_evaluation.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Interviewer implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int member_info_no;
	private int member_no;
	private long co_code;
	private long interviewer_no;
	private String name;
	private String email;
	private String phone;
	private String category;
	private String role;
	private String gender;
	private String resident_no;
	private String age;
	private String ssn;
	private int zoom_no;
	private int ir_path_code;
	private int interviewer_info_no;
	private String self_introduction;
	private String image;
	private String passcheck;
	private String job_posting_name;
}

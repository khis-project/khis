package com.kh.khis.interview_evaluation.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Assigned implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int assigned_no;
	private int member_info_no;
	private int assigned_interviewer;
	private String passcheck;
	private int co_code;
	private String final_pass_check;

}

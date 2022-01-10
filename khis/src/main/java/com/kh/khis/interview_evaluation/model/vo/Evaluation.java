package com.kh.khis.interview_evaluation.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Evaluation implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int evaluate_no;
	private int interview_no;
	private int member_info_no;
	private int evaluate_value;
	private String evaluate_comment;
	

}

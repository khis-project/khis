package com.kh.khis.interview_evaluation.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Detail implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int imember_info_no;
	private String title;
	private String evaluate_comment;
	private int member_info_no;

}

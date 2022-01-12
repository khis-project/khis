package com.kh.khis.interview_evaluation.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Interviews implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int evaluate_no;
	private int interview_no;
	private int member_no;
	private long co_code;
	private String name;
	private String title;
	private String content;
	private Date reg_date;
	private int member_info_no;
	private int evaluate_value;
	private String evaluate_comment;
	private String passcheck;
	

}

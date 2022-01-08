package com.kh.khis.interview_evaluation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PassOrNonPass {

	private int comment_no;
	private int member_info_no;
	private int imember_info_no;
	private int co_code;
	private String passcheck;
}

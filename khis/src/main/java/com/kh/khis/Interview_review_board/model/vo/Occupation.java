package com.kh.khis.Interview_review_board.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Occupation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int board_no;
	private String co_code;
	private String occupation_code;
	private String title;
	private String co_name;
	private String occupation_name;
	private Date reg_date;
	private int interview_evaluation;
}

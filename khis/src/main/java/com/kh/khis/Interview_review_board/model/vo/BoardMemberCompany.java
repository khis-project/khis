package com.kh.khis.Interview_review_board.model.vo;

import java.io.Serializable;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;



@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class BoardMemberCompany implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int board_no;
	private int pass_no;
	private String co_code;
	private String co_name;
	private String co_address; 
	private String occupation_code;
	private String occupation_name;
	private int count_board;
	private double score;
	private String occupation_img_url;
}
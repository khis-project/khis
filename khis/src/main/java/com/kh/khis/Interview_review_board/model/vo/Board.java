package com.kh.khis.Interview_review_board.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Board implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int boardNo;
	private int occupationCode;
	private int memberNo;
	private Integer pass_no;
	private String coCode;
	private String coAddr;
	private int interviewEvaluation;
	private String employmentType;
	private String title;
	private Date regDate;
	private String interviewDifficulty;
	private String interviewPath;
	private String interviewDate;
	private String recruitmentMethod;
	private String announcementTime;
	private String passcheck;
	private String co_name;
	private String interviewQuestion;
	private String interviewAnswer;
	private String occupation_name;
	private double score;
}

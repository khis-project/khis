package com.kh.khis.homepage_introduce_interview_pass.check.model.vo;

import java.io.Serializable;
import java.lang.reflect.Member;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Check implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int comment_no;
	private int member_info_no;
	private int imember_info_no;
	private int co_code;
	private char passcheck;
	

}

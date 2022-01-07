package com.kh.khis.interview_management.interview.model.vo;

import java.util.Date;

import com.kh.khis.interview_management.irinfo.model.vo.IRInfo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Interview {

	private int interviewNo;
	private int memberInfoNo;
	private long coCode;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	private int iMemberInfoNo;
	
	private IRInfo irInfo;
}

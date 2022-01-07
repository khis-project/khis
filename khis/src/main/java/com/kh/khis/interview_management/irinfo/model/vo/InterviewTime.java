package com.kh.khis.interview_management.irinfo.model.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class InterviewTime {
	private int iTimeNo;
	private int memberInfoNo;
	private long coCode;
	private Timestamp startTime;
	private Timestamp endTime;
	private String jobPostingName;

}

package com.kh.khis.interview_management.irinfo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AssignedInfo {
	private int assignedNo;
	//면접자회원번호
	private int memberInfoNo;
	//면접관회원번호
	private int assignedInterviewer;
}

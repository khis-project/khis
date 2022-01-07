package com.kh.khis.untact_interview_statistics_practice.statistics.model.vo;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = false)
public class Statistics implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int career_sum;
	private String age;
	private String passcheck;
	private long co_code;
	private int count;

}

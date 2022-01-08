package com.kh.khis.interview_evaluation.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Results implements Serializable {

	private static final long serialVersionUID = 1L;

	private int member_info_no;
	private String co_name;
	private String job_posting_name;
	private String final_pass_check;
	private Date interview_time;
}

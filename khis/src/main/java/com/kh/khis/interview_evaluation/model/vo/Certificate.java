package com.kh.khis.interview_evaluation.model.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = false)
public class Certificate {
	
	private int certificate_no;
	private int interviewer_info_no;
	private String certificate_name;
	private String certificate_issuer;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date certificate_date;

}

package com.kh.khis.untact_interview_statistics_practice.premium.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = false)
public class Premium implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String name;
	private int month;
	private Date leftDate; 
}

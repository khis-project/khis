package com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo;

import java.io.Serializable;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Zoom implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int zoomNo;
	private int memberNo;
    private	long coCode;
    private	String apiKey;
	private	String apiSecret;
	private	String zoomNumber;
	private	String zoomPassword;

}

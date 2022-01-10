package com.kh.khis.interview_evaluation.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PassYN implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int pass_no;
	private int member_info_no;
	private int co_code;
	private String final_pass_check;
	private Date reg_date;
	private String board_write_yn;

}

package com.kh.khis.login_join_mypage.model.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member implements Serializable {

	private static final long serialVersionUID = 1L;

	private int memberNo;
	private Long coCode;
	private String password;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private String email;
	private String phone;
	private String address;
	private String gender;
	private String kind;
	private Date joinDate;
	private String id;
	private long interviewerNo; //Integer null을 쓸수있다.
	private Integer memberInfoNo;
	private Integer month;
	private String endYN;

}

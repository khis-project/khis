package com.kh.khis.login_join_mypage.model.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class JoinFormDto {
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
	private Integer interviewerNo;
	private String coName;
	private String coAddress;
	private Integer count;
	private Integer offset;
}

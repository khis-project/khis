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

	/**
	 *
	 */
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
	private Long interviewerNo; //Integer null을 쓸수있다.
	private Integer memberInfoNo;

	/*
	 * public Member(long coCode, String password, String name, Date birthday,
	 * String email, String phone, String address, String gender, String kind, Date
	 * joinDate, String id, Integer interviewNo) { super(); this.coCode = coCode;
	 * this.password = password; this.name = name; this.birthday = birthday;
	 * this.email = email; this.phone = phone; this.address = address; this.gender =
	 * gender; this.kind = kind; this.joinDate = joinDate; this.id = id;
	 * this.interviewNo = interviewNo; }
	 */
}

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
public class EmailAuthCode implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int emailAuthCodeId; // primary key
	private String email;
	private String memberId; // 이게 유저 로그인할 떄 쓰는 아이디임
	private int authCode; // 인증번호
	
}	
	
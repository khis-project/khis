package com.kh.khis.login_join_mypage.model.vo;

import java.io.Serializable;

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
public class MemberCompany implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long coCode;
	private String coName;
	private String coAddress;

}

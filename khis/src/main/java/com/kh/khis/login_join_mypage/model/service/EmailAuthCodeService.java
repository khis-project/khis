package com.kh.khis.login_join_mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.khis.login_join_mypage.model.vo.EmailAuthCode;
import com.kh.khis.login_join_mypage.model.vo.Member;

public interface EmailAuthCodeService {

	int insertEmailAuthCode(EmailAuthCode emailAuthCode);

	EmailAuthCode selectOneEmailAuthCode(String id);

	int updateEmailAuthCode(EmailAuthCode emailAuthCode);

	List<EmailAuthCode> selectEmailAuthCodeList(Map<String, Object> param);

	EmailAuthCode findEmailAuthCodeByIdAndEmail(EmailAuthCode emailAuthCode);
	
	EmailAuthCode findEmailAuthCodeByIdAndEmailAndAuthCode(EmailAuthCode emailAuthCode);

}

package com.kh.khis.login_join_mypage.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.khis.login_join_mypage.model.vo.EmailAuthCode;

public interface EmailAuthCodeDao {

	int insertEmailAuthCode(EmailAuthCode emailAuthCode);

	EmailAuthCode selectOneEmailAuthCode(String id);

	int updateEmailAuthCode(EmailAuthCode emailAuthCode);

	List<EmailAuthCode> selectEmailAuthCodeList(Map<String, Object> param);

	EmailAuthCode findEmailAuthCodeByIdAndEmail(EmailAuthCode emailAuthCode);

	EmailAuthCode findEmailAuthCodeByIdAndEmailAndAuthCode(EmailAuthCode emailAuthCode);

}

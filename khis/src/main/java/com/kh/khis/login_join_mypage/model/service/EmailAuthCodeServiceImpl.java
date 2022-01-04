package com.kh.khis.login_join_mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khis.login_join_mypage.model.dao.EmailAuthCodeDao;
import com.kh.khis.login_join_mypage.model.dao.MemberDao;
import com.kh.khis.login_join_mypage.model.vo.EmailAuthCode;
import com.kh.khis.login_join_mypage.model.vo.Member;

@Service
public class EmailAuthCodeServiceImpl implements EmailAuthCodeService {

	@Autowired
	private EmailAuthCodeDao emailAuthCodeDao;

	@Override
	public int insertEmailAuthCode(EmailAuthCode emailAuthCode) {
		return emailAuthCodeDao.insertEmailAuthCode(emailAuthCode);
	}


	
    @Override
	public int updateEmailAuthCode(EmailAuthCode emailAuthCode) {
		return emailAuthCodeDao.updateEmailAuthCode(emailAuthCode);
	}

	@Override
	public List<EmailAuthCode> selectEmailAuthCodeList(Map<String, Object> param) {
		return emailAuthCodeDao.selectEmailAuthCodeList(param);
	}
	
	@Override
	public EmailAuthCode findEmailAuthCodeByIdAndEmail(EmailAuthCode emailAuthCode) {
		return emailAuthCodeDao.findEmailAuthCodeByIdAndEmail(emailAuthCode);
	}

	@Override
	public EmailAuthCode selectOneEmailAuthCode(String id) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public EmailAuthCode findEmailAuthCodeByIdAndEmailAndAuthCode(EmailAuthCode emailAuthCode) {
		// TODO Auto-generated method stub
		return emailAuthCodeDao.findEmailAuthCodeByIdAndEmailAndAuthCode(emailAuthCode);
	}

    
}

package com.kh.khis.login_join_mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.login_join_mypage.model.vo.EmailAuthCode;


@Repository
public class EmailAuthCodeDaoImpl implements EmailAuthCodeDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insertEmailAuthCode(EmailAuthCode emailAuthCode) {
		// TODO Auto-generated method stub
		return session.insert("emailAuthCode.insertEmailAuthCode", emailAuthCode);
	}

	@Override
	public EmailAuthCode selectOneEmailAuthCode(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("emailAuthCode.selectOneEmailAuthCode", id);
	}

	@Override
	public int updateEmailAuthCode(EmailAuthCode emailAuthCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<EmailAuthCode> selectEmailAuthCodeList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public EmailAuthCode findEmailAuthCode(EmailAuthCode emailAuthCode) {
//		// TODO Auto-generated method stub
//		return session.selectOne("emailAuthCode.findEmailAuthCode", emailAuthCode);
//	}

	@Override
	public EmailAuthCode findEmailAuthCodeByIdAndEmail(EmailAuthCode emailAuthCode) {
		// TODO Auto-generated method stub
		return session.selectOne("emailAuthCode.findEmailAuthCode", emailAuthCode);
	}

	@Override
	public EmailAuthCode findEmailAuthCodeByIdAndEmailAndAuthCode(EmailAuthCode emailAuthCode) {
		// TODO Auto-generated method stub
		return session.selectOne("emailAuthCode.findEmailAuthCode", emailAuthCode);
	}
	
	
	
	
//	@Override
//	public int insertMember(com.kh.khis.login_join_mypage.model.vo.EmailAuthCode emailAuthCode) {
//		return session.insert("member.insertMember", member);
//	}
//
//	@Override
//	public Member selectOneMember(String id) {
//		return session.selectOne("member.selectOneMember", id);
//	}
//	
//    @Override
//	public int updateMember(Member member) {
//		return session.update("member.updateMember", member);
//	}
//
//	@Override
//	public List<Member> selectMemberList(Map<String, Object> param) {
//		return session.selectList("member.selectMemberList", param);
//	}
//
//	@Override
//	public Member findMemberByPhoneAndEmail(Member member) {
//		// TODO Auto-generated method stub
//		return session.selectOne("member.findMemberByPhoneAndEmail",member);
//	}
	
	

    
}

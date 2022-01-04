package com.kh.khis.login_join_mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khis.login_join_mypage.model.dao.MemberCompanyDao;
import com.kh.khis.login_join_mypage.model.dao.MemberDao;
import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.login_join_mypage.model.vo.MemberCompany;

@Service
public class MemberCompanyServiceImpl implements MemberCompanyService {

	@Autowired
	private MemberCompanyDao memberCompanyDao;

	@Override
	public int insertMemberCompany(MemberCompany memberCompany) {
		return memberCompanyDao.insertMemberCompany(memberCompany);
	}

	@Override
	public MemberCompany selectOneMemberCompany(String id) {
		return memberCompanyDao.selectOneMemberCompany(id);
	}
	
    @Override
	public int updateMemberCompany(MemberCompany memberCompany) {
		return memberCompanyDao.updateMemberCompany(memberCompany);
	}

	@Override
	public List<MemberCompany> selectMemberCompanyList(Map<String, Object> param) {
		return memberCompanyDao.selectMemberCompanyList(param);
	}

    
}

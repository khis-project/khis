package com.kh.khis.login_join_mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.login_join_mypage.model.vo.MemberCompany;

@Repository
public class MemberCompanyDaoImpl implements MemberCompanyDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertMemberCompany(MemberCompany memberCompany) {
		return session.insert("member.insertMemberCompany", memberCompany);
	}

	@Override
	public MemberCompany selectOneMemberCompany(String id) {
		return session.selectOne("member.selectOneMemberCompany", id);
	}
	
    @Override
	public int updateMemberCompany(MemberCompany memberCompany) {
		return session.update("member.updateMemberCompany", memberCompany);
	}

	@Override
	public List<MemberCompany> selectMemberCompanyList(Map<String, Object> param) {
		return session.selectList("member.selectMemberCompanyList", param);
	}

    
}

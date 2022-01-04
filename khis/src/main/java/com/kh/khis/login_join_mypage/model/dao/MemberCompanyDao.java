package com.kh.khis.login_join_mypage.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.khis.login_join_mypage.model.vo.Member;
import com.kh.khis.login_join_mypage.model.vo.MemberCompany;

public interface MemberCompanyDao {

	int insertMemberCompany(MemberCompany memberCompany);

	MemberCompany selectOneMemberCompany(String id);

	int updateMemberCompany(MemberCompany memberCompany);

	List<MemberCompany> selectMemberCompanyList(Map<String, Object> param);

}

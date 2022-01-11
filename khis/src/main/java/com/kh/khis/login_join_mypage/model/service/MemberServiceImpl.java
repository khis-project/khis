package com.kh.khis.login_join_mypage.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khis.login_join_mypage.model.dao.MemberDao;
import com.kh.khis.login_join_mypage.model.dto.JoinFormDto;
import com.kh.khis.login_join_mypage.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public Member selectOneMember(String id) {
		return memberDao.selectOneMember(id);
	}

    @Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}

	@Override
	public List<JoinFormDto> selectMemberList(RowBounds rowBounds) {
		return memberDao.selectMemberList(rowBounds);
	}

	@Override
	public Member findMemberByPhoneAndEmail(Member member) {
		return memberDao.findMemberByPhoneAndEmail(member);
	}

	@Override
	public Member findMemberByIdAndEmail(Member member) {
		return memberDao.findMemberByIdAndEmail(member);
	}

	@Override
	public Member findInfo(Map<String, Object> param) {
		return memberDao.findInfo(param);
	}

	@Override
	public int deleteOneMember(String id) {
		return memberDao.deleteOneMember(id);
	}

	@Override
	public List<Map<String, Object>> selectScheduleList(Member member) {
		return memberDao.selectScheduleList(member);
	}

	@Override
	public int countMember(int id) {
		return memberDao.countMember(id);
	}

	@Override
	public List<JoinFormDto> selectAdminMemberList(RowBounds rowBounds) {
		return memberDao.selectAdminMemberList(rowBounds);
	}


	/*
	 * @Override public List<JoinFormDto> selectMemberList(Map<String, Object>
	 * param) { return memberDao.selectMemberList(param); }
	 */


}

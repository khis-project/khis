package com.kh.khis.login_join_mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.login_join_mypage.model.dto.JoinFormDto;
import com.kh.khis.login_join_mypage.model.dto.PagingDto;
import com.kh.khis.login_join_mypage.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insertMember(Member member) {
		return session.insert("member.insertMember", member);
	}

	@Override
	public Member selectOneMember(String id) {
		return session.selectOne("member.selectOneMember", id);
	}

    @Override
	public int updateMember(Member member) {
		return session.update("member.updateMember", member);
	}

	@Override
	public List<JoinFormDto> selectMemberList(RowBounds rowBounds) {
		if (rowBounds == null) {
			return session.selectList("member.selectMemberList");
		}
		return session.selectList("member.selectMemberList", null, rowBounds);
	}

	@Override
	public Member findMemberByPhoneAndEmail(Member member) {
		return session.selectOne("member.findMemberByPhoneAndEmail",member);
	}

	@Override
	public Member findMemberByIdAndEmail(Member member) {
		return session.selectOne("member.findMemberByIdAndEmail", member);
	}

	@Override
	public Member findInfo(Map<String, Object> param) {
		return session.selectOne("member.findInfo", param);
	}

	@Override
	public int deleteOneMember(String id) {
		return session.delete("member.deleteOneMember", id);
	}

	@Override
	public List<Map<String, Object>> selectScheduleList(Member member) {
		return session.selectList("member.selectScheduleList", member);
	}

	@Override
	public int countMember(int count) {
		return session.selectOne("member.countMember", count);
	}

	/*
	 * @Override public List<JoinFormDto> selectMemberList(Map<String, Object>
	 * param) { return session.selectList("member.selectMemberList", param); }
	 */


}

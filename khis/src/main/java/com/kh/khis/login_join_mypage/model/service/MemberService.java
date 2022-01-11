package com.kh.khis.login_join_mypage.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.khis.login_join_mypage.model.dto.JoinFormDto;
import com.kh.khis.login_join_mypage.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member selectOneMember(String id);

	Member findInfo(Map<String, Object> param);

	int updateMember(Member member);

	List<JoinFormDto> selectMemberList(RowBounds rowBounds);

	/* List<JoinFormDto> selectMemberList(Map<String, Object> param); */

	List<Map<String, Object>> selectScheduleList(Member member);

	Member findMemberByPhoneAndEmail(Member member);

	Member findMemberByIdAndEmail(Member member);

	int deleteOneMember(String id);

	int countMember(int id);

	List<JoinFormDto> selectAdminMemberList(RowBounds params);

}

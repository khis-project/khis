package com.kh.khis.homepage_introduce_interview_pass.check.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.homepage_introduce_interview_pass.check.model.vo.Check;

@Repository
public class CheckDaoImpl implements CheckDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Check> selectCheckList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit); 
		return session.selectList("Check.selectCheckList", null, rowBounds);
	}

	@Override
	public int selectCheckTotalCount() {
		return session.selectOne("check.selectCheckTotalCount");
	}
}

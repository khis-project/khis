package com.kh.khis.homepage_introduce_interview_pass.check.model.dao;

import java.util.List;

import com.kh.khis.homepage_introduce_interview_pass.check.model.vo.Check;

public interface CheckDao {

	List<Check> selectCheckList(int offset, int limit);
	
	int selectCheckTotalCount();

	
	

}

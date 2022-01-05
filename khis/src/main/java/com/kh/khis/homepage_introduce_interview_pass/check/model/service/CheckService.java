package com.kh.khis.homepage_introduce_interview_pass.check.model.service;

import java.util.List;

import com.kh.khis.homepage_introduce_interview_pass.check.model.vo.Check;

public interface CheckService {

	static List<Check> selectcheckList(int offset, int limit) {
		// TODO Auto-generated method stub
		return null;
	}
	
	int selecCheckTotalCount();

	List<Check> selectCheckList(int offset, int limit);
	
	
	
	
	


}

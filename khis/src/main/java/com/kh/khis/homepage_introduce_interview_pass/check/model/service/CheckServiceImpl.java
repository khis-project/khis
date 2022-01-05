package com.kh.khis.homepage_introduce_interview_pass.check.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khis.homepage_introduce_interview_pass.check.model.dao.CheckDao;
import com.kh.khis.homepage_introduce_interview_pass.check.model.vo.Check;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("checkService")
public class CheckServiceImpl implements CheckService {
	@Autowired
	private CheckDao checkDao;

	@Override
	public List<Check> selectCheckList(int offset, int limit) {
		return checkDao.selectCheckList(offset, limit);
	}
	@Override
	public int selecCheckTotalCount() {
		return checkDao.selectCheckTotalCount();
	}

	
}

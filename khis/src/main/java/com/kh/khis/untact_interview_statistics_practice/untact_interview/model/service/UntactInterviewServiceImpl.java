package com.kh.khis.untact_interview_statistics_practice.untact_interview.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.dao.UntactInterviewDao;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("UntactInterviewService")
@Transactional
public class UntactInterviewServiceImpl implements UntactInterviewService {

	@Autowired
	private UntactInterviewDao untactInterviewDao;

	@Override
	public List<Zoom> selectZoomList() {
		return untactInterviewDao.selectZoomList();
	}

	@Override
	public int insertZoom(Zoom zoom) {
		return untactInterviewDao.insertZoom(zoom);
	}

	
}

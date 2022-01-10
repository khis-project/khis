package com.kh.khis.untact_interview_statistics_practice.untact_interview.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.dao.UntactInterviewDao;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Ir_info;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("UntactInterviewService")
@Transactional
public class UntactInterviewServiceImpl implements UntactInterviewService {

	@Autowired
	private UntactInterviewDao untactInterviewDao;

	@Override
	public List<Zoom> selectZoomList(int offset, int limit, int member_no) {
		return untactInterviewDao.selectZoomList(offset, limit,member_no);
	}

	@Override
	public int insertZoom(Zoom zoom) {
		return untactInterviewDao.insertZoom(zoom);
	}

	
	@Override 
	public List<Zoom> selectZoomIRList(int member_no) { 
		return untactInterviewDao.selectZoomIRList(member_no); 
		}
	 

	@Override
	public Zoom selectZoom(int zoom_no_int) {
		return untactInterviewDao.selectZoom(zoom_no_int);
	}

	@Override
	public int deleteZoom(int zoom_no_int) {
		return untactInterviewDao.deleteZoom(zoom_no_int);
	}

	@Override
	public int updateZoom(Zoom zoom) {
		return untactInterviewDao.updateZoom(zoom);
	}

	@Override
	public int selectZoomTotalCount(int member_no) {
		return untactInterviewDao.selectZoomTotalCount(member_no);
	}

	@Override
	public Zoom selectZoomIr_Info(int member_info_no) {
		return untactInterviewDao.selectZoomIr_Info(member_info_no);
	}

	/*
	 * @Override public List<Zoom> selectZoomList2(int member_no) { return
	 * untactInterviewDao.selectZoomList2(member_no); }
	 */

	
}

package com.kh.khis.untact_interview_statistics_practice.untact_interview.model.dao;

import java.util.List;

import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Ir_info;

import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;


public interface UntactInterviewDao {

	List<Zoom> selectZoomList(int offset, int limit, int member_no);

	int insertZoom(Zoom zoom);

//	List<Zoom> selectZoomList(int member_no);

	Zoom selectZoom(int zoom_no_int);

	int deleteZoom(int zoom_no_int);

	int updateZoom(Zoom zoom);

	int selectZoomTotalCount(int member_no);

	List<Zoom> selectZoomIRList(int member_no);

	Zoom selectZoomIr_Info(int member_info_no);


}

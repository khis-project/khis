package com.kh.khis.untact_interview_statistics_practice.untact_interview.model.dao;

import java.util.List;

import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;


public interface UntactInterviewDao {

	List<Zoom> selectZoomList();

	int insertZoom(Zoom zoom);


}

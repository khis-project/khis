package com.kh.khis.untact_interview_statistics_practice.untact_interview.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;


@Repository
public class UntactInterviewDaoImpl implements UntactInterviewDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Zoom> selectZoomList() {
		return session.selectList("UntactInterview.selectZoomList");
	}

	@Override
	public int insertZoom(Zoom zoom) {
		return session.insert("UntactInterview.insertZoom",zoom);
	}

	
}

package com.kh.khis.untact_interview_statistics_practice.untact_interview.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Ir_info;
import com.kh.khis.untact_interview_statistics_practice.untact_interview.model.vo.Zoom;

@Repository
public class UntactInterviewDaoImpl implements UntactInterviewDao {

	@Autowired
	private SqlSession session;

	//
	 @Override public List<Zoom> selectZoomList(int offset, int limit, int member_no) { 
		 RowBounds rowBounds = new RowBounds(offset, limit); 
		 return session.selectList("UntactInterview.selectZoomList",member_no, rowBounds); 
	}

	 @Override public List<Zoom> selectZoomIRList(int member_no) { 
		 return session.selectList("UntactInterview.selectZoomIRList", member_no); 
	 }

	@Override
	public int insertZoom(Zoom zoom) {
		return session.insert("UntactInterview.insertZoom", zoom);
	}




	@Override
	public Zoom selectZoom(int zoom_no_int) {
		return session.selectOne("UntactInterview.selectZoom", zoom_no_int);
	}

	@Override
	public int deleteZoom(int zoom_no_int) {
		return session.delete("UntactInterview.deleteZoom", zoom_no_int);
	}

	@Override
	public int updateZoom(Zoom zoom) {
		System.out.println("zoomDao : " + zoom);
		return session.update("UntactInterview.updateZoom", zoom);
	}

	@Override
	public int selectZoomTotalCount(int member_no) {
		return session.selectOne("UntactInterview.selectZoomTotalCount", member_no);

	}

	@Override
	public Zoom selectZoomIr_Info(int member_info_no) {
		return session.selectOne("UntactInterview.selectZoomIr_Info", member_info_no);
	}

	/*
	 * @Override public List<Zoom> selectZoomList2(int member_no) { return
	 * session.selectList("UntactInterview.selectZoomList2",member_no); }
	 */

}

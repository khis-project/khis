package com.kh.khis.login_join_mypage.model;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

public class CustomDateHandler extends BaseTypeHandler<Date> {

	@Override
	public Date getNullableResult(ResultSet rs, String columnName) throws SQLException {
		java.sql.Date sqlTimestamp = rs.getDate(columnName);
		if (sqlTimestamp != null) {
			return new Date(sqlTimestamp.getTime());
		}
		return null;
	}

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, Date parameter, JdbcType jdbcType)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public Date getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		java.sql.Date sqlTimestamp = rs.getDate(columnIndex);
		if (sqlTimestamp != null) {
			return new Date(sqlTimestamp.getTime());
		}
		return null;
	}

	@Override
	public Date getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		java.sql.Date sqlTimestamp = cs.getDate(columnIndex);
		if (sqlTimestamp != null) {
			return new Date(sqlTimestamp.getTime());
		}
		return null;
	}

}

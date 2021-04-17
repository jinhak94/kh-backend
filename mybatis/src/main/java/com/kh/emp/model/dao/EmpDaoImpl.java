package com.kh.emp.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class EmpDaoImpl implements EmpDao {

	@Override
	public List<Map<String, Object>> selectAll(SqlSession session) {
		return session.selectList("emp.selectAll");
	}

	@Override
	public List<Map<String, Object>> select1(SqlSession session, Map<String, String> param) {
		return session.selectList("emp.search1", param);
	}
	
	@Override
	public List<Map<String, Object>> select2(SqlSession session, Map<String, String> param) {
 		return session.selectList("emp.search2", param);
	}

	@Override
	public List<Map<String, String>> selectJobList(SqlSession session) {
		return session.selectList("emp.selectJobList");
	}

	@Override
	public List<Map<String, Object>> select3(SqlSession session, Map<String, Object> param) {
 		return session.selectList("emp.search3", param);
	}

	@Override
	public List<Map<String, String>> selectDeptList(SqlSession session) {
		return session.selectList("emp.selectDeptList");
	}
}

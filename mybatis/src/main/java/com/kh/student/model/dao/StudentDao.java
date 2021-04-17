package com.kh.student.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.student.model.vo.Student;

public class StudentDao implements IStudentDao {

	@Override
	public int insertStudent(SqlSession session, Student stdt) {
		
		//mapper의 namespace와 하위 값 student.insertStudent
		return session.insert("student.insertStudent", stdt);
	}

	@Override
	public int insertStudentMap(SqlSession session, Map<String, Object> studentMap) {
		return session.insert("student.insertStudentMap", studentMap);
	}

	@Override
	public int selectTotalStudents(SqlSession session) {
		return session.selectOne("student.selectTotalStudents");
	}

	@Override
	public Student selectOne(SqlSession session, int no) {
		return session.selectOne("student.selectOne", no);
	}

	@Override
	public int updateStudent(SqlSession session, Map<String, Object> map) {
		return session.update("student.updateStudent", map);
	}

	@Override
	public int deleteStudent(SqlSession session, Map<String, Object> map) {
		return session.delete("student.deleteStudent", map);
	}

	@Override
	public Map<String, Object> selectStudentMap(SqlSession session, int no) {
		return session.selectOne("student.selectStudentMap", no);
	}

	@Override
	public List<Student> selectStudentList(SqlSession session) {
		return session.selectList("student.selectList");
	}

	@Override
	public List<Map<String, Object>> selectStudentMapList(SqlSession session) {
		return session.selectList("student.selectStudentMapList");
	}
}

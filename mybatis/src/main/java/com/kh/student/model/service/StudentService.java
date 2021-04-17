package com.kh.student.model.service;

//구현 객체가 달라질 경우를 대비한 것
import static com.kh.common.SqlSessionTemplate.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.student.model.dao.IStudentDao;
import com.kh.student.model.dao.StudentDao;
import com.kh.student.model.vo.Student;

public class StudentService implements IStudentService{
	
	private IStudentDao studentDao = new StudentDao();

	@Override
	public int insertStudent(Student stdt) {
		SqlSession session = getSqlSession();
		int result = 0;
		try {
			result = studentDao.insertStudent(session, stdt);
			session.commit();
		} catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int insertStudent(Map<String, Object> studentMap) {
		SqlSession session = getSqlSession();
		int result = 0;
		try {
			result = studentDao.insertStudentMap(session, studentMap);
			session.commit();
		}catch(Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int selectTotalStudents() {
		SqlSession session = getSqlSession();
		int totalStudents = studentDao.selectTotalStudents(session);
		
		return totalStudents;
	}

	@Override
	public Student selectOne(int no) {
		SqlSession session = getSqlSession();
		Student student = studentDao.selectOne(session, no);
		session.close();
		return student;
	}

	@Override
	public int updateStudent(Map<String, Object> map) {
		SqlSession session = getSqlSession();
		int result = 0;
		System.out.println("test" + result);
		try {
			//dml실행구문
			result = studentDao.updateStudent(session, map);
			
			session.commit();
		}catch(Exception e){
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}

	@Override
	public int deleteStudent(Map<String, Object> map) {
		SqlSession session = getSqlSession();
		int result = 0;
		System.out.println("test" + result);
		try {
			//dml실행구문
			result = studentDao.deleteStudent(session, map);
			
			session.commit();
		}catch(Exception e){
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}

	@Override
	public Map<String, Object> selectStudentMap(int no) {
		SqlSession session = getSqlSession();
		Map<String, Object> student = studentDao.selectStudentMap(session, no);
		session.close();
		return student;
	}

	@Override
	public List<Student> selectStudentList() {
		SqlSession session = getSqlSession();
		List<Student> list = studentDao.selectStudentList(session);
		session.close();
		return list;
	}

	@Override
	public List<Map<String, Object>> selectStudentMapList() {
		SqlSession session = getSqlSession();
		List<Map<String,Object>> mapList = studentDao.selectStudentMapList(session);
		session.close();
		return mapList;
	}
}

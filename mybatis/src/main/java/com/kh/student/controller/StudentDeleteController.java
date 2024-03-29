package com.kh.student.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.AbstractController;
import com.kh.student.model.service.IStudentService;
import com.kh.student.model.service.StudentService;

public class StudentDeleteController extends AbstractController {
	private IStudentService studentService = new StudentService();
	
	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) {
	//1. 사용자입력값 처리
	int no = 0;
	try {
		no = Integer.parseInt(request.getParameter("no"));
	} catch (NumberFormatException e) {
		e.printStackTrace();
	}
	System.out.println("StudentDeleteController@No = " + no);
	
	Map<String, Object> map = new HashMap<>();
	map.put("no", no);
	System.out.println("map@controller  = " + map);
	
	//2. 업무로직
	int result = studentService.deleteStudent(map);
	String msg = result > 0 ? 
			"학생 정보 삭제 성공!" : 
				"학생 정보 삭제 실패!";
	
	//3. 사용자피드백 & 리다이렉트
	request.getSession().setAttribute("msg", msg);
	
	return "redirect:/student/selectStudent.do";

	}
}

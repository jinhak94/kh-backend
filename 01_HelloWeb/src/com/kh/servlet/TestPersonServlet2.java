package com.kh.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * POST  /web/testPerson2.do
 */
public class TestPersonServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 한글깨짐 방지 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		//2. 사용자 입력값 처리
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String animal = request.getParameter("animal");
		String[] foodArr = request.getParameterValues("foor");
		
		System.out.println("name = " + name);
		System.out.println("color = " + color);
		System.out.println("animal = " + animal);
		System.out.println("food = " + Arrays.deepToString(foodArr));
		
		//servlet에서 생산한 데이터
		Date now = new Date();
		//request의 속성(임시 저장소) 저장
		request.setAttribute("now", now);
		
		//3. 응답처리
		//jsp로 html 작성을 위임.
		RequestDispatcher reqDispatcher
			= request.getRequestDispatcher("/servlet/testResult.jsp");
		reqDispatcher.forward(request, response);
		
		
	}

}

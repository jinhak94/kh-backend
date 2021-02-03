package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 	<pre>
 *	Servlet : 웹서비스를 위한 자바클래스로써, 반드시 HttpServlet를 상속.
 *  
 *	Servlet 인터페이스 
 *   └ GenericServlet 추상클래스 
 *      └ HttpServlet 추상클래스
 *      
 *  서블릿의 생명주기
 *  - 컨테이너(WAS)에 의해서 싱글톤(프로그램 내에서 단 하나의 객체만 생성/관리)으로 관리되는 객체
 *
 *  객체생성 - init(설정) - service(매사용자요청, 분기처리(doGet이나 doPost) - doGet | doPost
 *  (서버중지 또는 재시작)
 *  destroy - 객체반환
 *  
 *  java/xml 파일 수정시 서버재시작해야 한다.
 *  메소드의 몸통 수정시에만 eclipse에서 reload 기능을 이용할 수 있다.
 *  
 *	</pre>
 */

public class TestPersonServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestPersonServlet1() {
        super();
        System.out.println("객체생성 : " + this.hashCode());
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init!");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("destroy!");
	}

	/**
	 * <pre>
	 * GET 방식 요청시 호출 메소드
	 * 
	 * HttpServletRequest  인터페이스
	 * 		사용자 요청 관련 정보 : 사용자입력값, 쿠키, 요청관련 헤더, 세션
	 * 
	 * HttpServletResponse 인터페이스
	 * 		사용자 응답 관련 정보 : 응답출력스트림, 응답헤더 작성
	 * </pre>
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 호출" + this.hashCode());

		//1. 사용자 입력값 확인 : 자바변수에 옮겨담기
			String name = request.getParameter("name");
			String color = request.getParameter("color");
			String animal = request.getParameter("animal");
			String[] foodArr = request.getParameterValues("food");
			
			System.out.println("name = " + name);
			System.out.println("color = " + color);
			System.out.println("animal = " + animal);
			System.out.println("food = " + Arrays.toString(foodArr));
			
		//2. 응답 작성
		//응답 출력스트림
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='utf-8'/>");
		out.println("<title>테스트 결과</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>테스트결과</h1>");
		out.println("<p>이름 : " + name + "</p>");
		out.println("<p>색깔 : " + color + "</p>");
		out.println("<p>동물 : " + animal + "</p>");
		out.println("<p>음식 : " + Arrays.toString(foodArr) + "</p>");
		out.println("</body>");
		out.println("</html>");
		
	}
	/**
	 * POST 방식 요청시 호출 메소드
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 호출" + this.hashCode());

		//0. POST 방식은 utf-8 인코딩 처리선언
			request.setCharacterEncoding("utf-8");
		
		//1. 사용자 입력값 확인 : 자바변수에 옮겨담기
			String name = request.getParameter("name");
			String color = request.getParameter("color");
			String animal = request.getParameter("animal");
			String[] foodArr = request.getParameterValues("food");
			
			System.out.println("name = " + name);
			System.out.println("color = " + color);
			System.out.println("animal = " + animal);
			System.out.println("food = " + Arrays.toString(foodArr));
			
		//2. 응답 작성
		//응답 출력스트림
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='utf-8'/>");
		out.println("<title>테스트 결과</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>테스트결과</h1>");
		out.println("<p>이름 : " + name + "</p>");
		out.println("<p>색깔 : " + color + "</p>");
		out.println("<p>동물 : " + animal + "</p>");
		out.println("<p>음식 : " + Arrays.toString(foodArr) + "</p>");
		out.println("</body>");
		out.println("</html>");

	}
}

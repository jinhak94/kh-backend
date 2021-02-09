package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.util.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/member/memberEnroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	
	/**
	 * 회원가입 폼을 제공
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberEnroll.jsp")
		       .forward(request, response);
	}

	/**
	 * 폼제출 : 회원가입 처리
	 * 
	 * 회원가입 성공/실패여부를 사용자에게 경고창으로 알림할 것.
	 * 마지막에 인덱스페이지로 이동할 것.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩처리
		request.setCharacterEncoding("utf-8");
		
		Date birthDay = null;
		String date = request.getParameter("birthDay");
		if(!(date.equals(""))) {
			birthDay = Date.valueOf(date);
		}
//		Date enrollDate = new java.sql.Date(System.currentTimeMillis());
		String[] hobbyArr = request.getParameterValues("hobby");
		String hobby = "";
		if(hobbyArr!=null) {
			for(int i = 0; i < hobbyArr.length; i++) {
				if(i!=0 && i==(hobbyArr.length-1))
					hobby+= ", ";
				hobby += hobbyArr[i];
			}
		}
		String email = request.getParameter("email");
		if(email.equals("")) {
			email = null;
		}
		String address = request.getParameter("address");
		if(address.equals("")) {
			address = null;
		}
		Member member = new Member();
		member.setMemberId(request.getParameter("memberId"));
		member.setPassword(MvcUtils.getEncryptedPassword(request.getParameter("password")));
		member.setMemberName(request.getParameter("memberName"));
		member.setGender(request.getParameter("gender"));
		member.setBirthDay(birthDay);
		member.setEmail(email);
		member.setPhone(request.getParameter("phone"));
		member.setAddress(address);
		member.setHobby(hobby);		
		member.setEnrollDate(null);
				
		int enrollChk = memberService.insertMember(member);
		if(enrollChk != 0) {
			request.setAttribute("msg", "회원가입에 성공하셨습니다.");
		}else {
			request.setAttribute("msg", "회원가입에 실패하셨습니다..");
		}
		//DML, login 등 요청후 반드시 url을 변경해서 새로고침 사고를 방지한다.
		request.setAttribute("loc", request.getContextPath());
		RequestDispatcher reqDispatcher = 
				request.getRequestDispatcher("/index.jsp");
		reqDispatcher.forward(request, response);
	}
}





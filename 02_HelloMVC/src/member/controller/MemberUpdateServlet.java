package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/member/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		Date birthDay = null;
		String date = request.getParameter("birthDay");
		if(!(date.equals(""))) {
			birthDay = Date.valueOf(date);
		}
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String[] hobbyArr = request.getParameterValues("hobby");
		String hobby = "";
		if(hobbyArr!=null) {
			for(int i = 0; i < hobbyArr.length; i++) {
				if(i!=0 && i==(hobbyArr.length-1))
					hobby+= ", ";
				hobby += hobbyArr[i];
			}
		}
		Member member = 
				new Member(memberId, null, memberName, "U", 
				gender, birthDay, email, phone, address, hobby, null);
		//받은 결과에 따라 뷰페이지 내보내기
		String msg = null;
		HttpSession session = request.getSession(true);
		String loc = request.getContextPath() + "/member/memberView?memberId=" + member.getMemberId();
		int updateChk = memberService.updateMember(member);
		if(updateChk != 0) {
			msg = "회원정보 수정에 성공하셨습니다.";
			session.setAttribute("memberLoggedIn",  memberService.selectOne(memberId));
		}else {
			msg = "회원정보 수정에 실패하셨습니다.";
		}
		//DML, login 등 요청후 반드시 url을 변경해서 새로고침 사고를 방지한다.
		session.setAttribute("msg", msg);
		request.setAttribute("member", member);
		//변경한 회원정보를 세션에 저장
//		request.getRequestDispatcher("/WEB-INF/views/member/memberView.jsp").forward(request, response);
		
		response.sendRedirect(loc);
	}
}

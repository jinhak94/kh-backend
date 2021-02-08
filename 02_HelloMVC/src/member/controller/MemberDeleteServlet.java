package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import member.model.service.MemberService;
/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/member/memberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession(true);
		String memberId = request.getParameter("memberId");
		
		int deleteChk = memberService.deleteMember(memberId);
		if(deleteChk != 0) {
			request.setAttribute("msg", "회원 탈퇴에 성공하셨습니다.");
		}else {
			request.setAttribute("msg", "회원 탈퇴에 실패하셨습니다..");
		}
		//DML, login 등 요청후 반드시 url을 변경해서 새로고침 사고를 방지한다.
		request.setAttribute("loc", request.getContextPath());

		//탈퇴한 회원정보를 세션에서 제거 후 명시적 종료
		session.removeAttribute("memberLoggedIn");
		session.invalidate();
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
}
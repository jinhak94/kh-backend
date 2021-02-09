package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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

		//서비스 로직 호출
		int deleteChk = memberService.deleteMember(memberId);

		//받은 결과에 따라 뷰페이지 내보내기
//		String view = "/index.jsp";
		String msg = null;
		String loc = null;
		
		if(deleteChk != 0) {
			msg = "성공적으로 회원정보를 삭제했습니다.";
			loc = request.getContextPath() + "/member/logout";//회원탈퇴인 경우, 로그아웃 처리함.
		}else {
			msg = "회원정보삭제에 실패했습니다.";
			loc = request.getContextPath() + "/member/memberView?memberId=" + memberId;
		}
		//DML, login 등 요청후 반드시 url을 변경해서 새로고침 사고를 방지한다.
		if(session!=null) {
			session.invalidate();
		}
//		session.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
		
		//탈퇴한 회원정보를 세션에서 제거 후 명시적 종료

//		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
//		reqDispatcher.forward(request, response);
		response.sendRedirect(loc);
	}
}
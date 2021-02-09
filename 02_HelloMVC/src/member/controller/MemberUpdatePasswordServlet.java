package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.util.MvcUtils;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdatePasswordServlet
 */
@WebServlet("/member/updatePassword")
public class MemberUpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/updatePassword.jsp").forward(request, response);;
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 입력한 비밀번호 값들을 가져오기
		String password = MvcUtils.getEncryptedPassword(request.getParameter("password"));
		String newPassword = MvcUtils.getEncryptedPassword(request.getParameter("newPassword"));
		String passwordCheck = MvcUtils.getEncryptedPassword(request.getParameter("passwordCheck"));
		System.out.println(password);
		System.out.println(newPassword);
		System.out.println(passwordCheck);
		
		//2. 세션에 저장된 로그인 정보 가져오기
		HttpSession session = request.getSession(true);
		Member member = (Member)session.getAttribute("memberLoggedIn");

		//3. 입력한 비밀번호가 로그인된 유저의 비밀번호와 일치하는 경우
		if(password == null || newPassword == null || passwordCheck == null ||
				member == null) {
			session.setAttribute("msg", "회원 오류.");
			response.sendRedirect(request.getContextPath());
		}else if(!member.getPassword().equals(password)){
			//4. 입력한 비밀번호가 로그인된 유저의 비밀번호와 일치하지 않는 경우
			session.setAttribute("msg", "비밀번호가 틀렸습니다.");
			response.sendRedirect(request.getContextPath() + "/member/updatePassword");
		}
		// 이 부분은 javascript의 유효성검사로 처리가 가능한 부분
//		else if(!newPassword.equals(passwordCheck)) {
//			// 새 비밀번호와 비밀번호 체크가 일치하지 않는 경우 메세지 출력
//			session.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
//			response.sendRedirect(request.getContextPath() + "/member/updatePassword");
//		}
		else{
		// 비밀번호가 일치. 비밀번호 변경 성공 메세지 출력 및 index 페이지로 이동
			int result = memberService.updatePassword(newPassword, member.getMemberId());
			String msg = result > 0 ? "비밀번호 변경에 성공하였습니다. 다시 로그인해주세요." : "비밀번호 변경에 실패하였습니다.";
			session.setAttribute("msg", msg);
			session.removeAttribute("memberLoggedIn");
			response.sendRedirect(request.getContextPath());
		}
	}
}

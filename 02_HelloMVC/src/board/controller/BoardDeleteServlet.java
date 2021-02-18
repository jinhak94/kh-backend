package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/board/boardDelete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String rName = request.getParameter("rName");
		
		int result = boardService.deleteBoard(boardNo);
		String msg = result > 0 ? "게시글을 삭제하였습니다." : "게시글을 삭제하지 못했습니다."; 
	
		//첨부파일이 있는 경우, 삭제처리
		if(result > 0 && !"".equals(rName)) {
			String saveDirectory = getServletContext().getRealPath("/upload/board");
			File delFile = new File(saveDirectory, rName);
			//삭제 되면 true 리턴
			boolean bool = delFile.delete();
			msg += bool ? "(첨부파일삭제성공)" : "(첨부파일삭제실패)";
		};
		
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/board/boardList");
	}
}

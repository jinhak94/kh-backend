package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;

/**
 * Servlet implementation class BoardCommentDeleteServlet
 */
@WebServlet("/board/boardCommentDelete")
public class BoardCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardService boardService = new BoardService();   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//boardCommentNo=" + boardCommentNo + 
		//"&boardNo=<%=board.getBoardNo()
		
		int boardCommentNo = Integer.parseInt(request.getParameter("boardCommentNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		int result = boardService.boardCommentDelete(boardCommentNo);
		
		String msg = result>0 ? "정상적으로 삭제되었습니다." : "삭제에 실패하였습니다.";
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/board/boardView?boardNo=" + boardNo);
	}
}

package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/board/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/boardUpdate.jsp")
			   .forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardTitle = request.getParameter("boardTitle");
		String boardWriter = request.getParameter("boardWriter");
		String boardContent = request.getParameter("boardContent");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		Board board = new Board(boardNo, boardTitle, boardWriter, boardContent, null, null, null, 0);
		int result = boardService.updateBoard(board);
		String msg = result>0 ? "게시글을 수정하였습니다." : "게시글 수정에 실패했습니다.";
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg);
		
		String location = result > 0? 
				request.getContextPath() + "/board/boardView?boardNo=" + board.getBoardNo():
				request.getContextPath() + "/board/boardList";
				
		response.sendRedirect(location);
	}

}

package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.exception.BoardException;
import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardViewServlet
 */
@WebServlet("/board/boardView")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{//1. 사용자 입력값 처리
			int boardNo = 0;
			
			try{
				boardNo = Integer.parseInt(request.getParameter("boardNo"));
			}catch(NumberFormatException e) {
				throw new BoardException("유효한 게시글 번호가 아닙니다 : \"" + request.getParameter("boardNo") + "\"", e);
			}
			
			//2. 업무로직 : 게시글 조회
			int result = boardService.updateBoardReadCount(boardNo);
			Board board = boardService.selectOne(boardNo);
	//		System.out.println("board@BoardViewServlet = " + board);
			
			if(board==null) {
				throw new BoardException("해당 게시글이 존재하지 않습니다. : " + boardNo);
			}
			
			//content 추가 처리
			//스크립팅 공격 방지
			String boardContent = board.getBoardContent()
									   .replaceAll("<",  "&lt;")
									   .replaceAll(">", "&gt;");
					
			//개행문자
			boardContent = boardContent.replaceAll("\\n", "<br>");
			
			//XSS 공격대비
			board.setBoardContent(boardContent);
			//3. view단 처리 : jsp forwarding
			request.setAttribute("board", board);
			request.getRequestDispatcher("/WEB-INF/views/board/boardView.jsp")
				   .forward(request, response);
		}catch(BoardException e) {
			e.printStackTrace();
			throw e;
		}
	}
}

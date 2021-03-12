package board.faqBoard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Board;
import board.faqBoard.model.service.FaqService;
import member.model.vo.Member;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/board/faq/boardDelete")
public class FaqBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FaqService faqService = new FaqService();

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.사용자 입력값
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String rName = request.getParameter("rName");
		
		//2.업무로직
		int result = faqService.deleteFaqBoard(boardNo);
		String msg = result > 0 ? "게시물 삭제 성공!" : "게시물 삭제 실패!";
		
		//첨부파일이 있는 경우, 삭제처리
		if(result > 0 && !"".equals(rName)) {
			String saveDirectory = getServletContext().getRealPath("/upload/board");
			File delFile = new File(saveDirectory, rName);
			boolean bool = delFile.delete();
			msg += bool ? "(첨부파일삭제성공)" : "(첨부파일삭제실패)"; 
		}
		
		//3.사용자메세지 및 redirect처리
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/board/faq/boardList");
	}

}

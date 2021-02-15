package board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import common.util.MvcUtils;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardService boardService = new BoardService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자 입력값 처리 cpage, numPerPage = 5
		int cpage = 1;
		try {
			cpage = Integer.parseInt(request.getParameter("cpage"));			
		}catch(NumberFormatException e) {
			//예외가 발생한 경우, cpage 값은 1로 유지한다.
		}
		int numPerPage = 5;
		Map<String, Object> param = new HashMap<>();
		param.put("cpage", cpage);
		param.put("numPerPage", numPerPage);

		//2. 업무로직 : 각 페이지에 해당하는 게시글 가져오기
		List<Board> list = boardService.selectBoard(param);
		//totalContents 총게시물수
		int totalContents = boardService.selectTotalBoards(param);
		System.out.println("BoardListServlet@ = " + totalContents);
		//url 페이지링크를 클릭했을 때 이동할 주소
		// /mvc/board/boardList
		String url = request.getRequestURI();
		System.out.println("BoardListServlet@ = " + url);
		//페이지바 작성
		String pageBar = MvcUtils.getPageBar(totalContents, cpage, numPerPage, url);
		
		//3. view단 처리
		//jsp에 전달할 값은 request 속성을 이용한다.
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views/board/boardList.jsp")
				.forward(request, response);
		
	}
}

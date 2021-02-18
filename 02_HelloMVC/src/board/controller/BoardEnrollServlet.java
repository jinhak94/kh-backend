package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.service.BoardService;
import board.model.vo.Board;
import common.MvcFileRenamePolicy;

/**
 * Servlet implementation class BoardEnrollServlet
 */
@WebServlet("/board/boardEnroll")
public class BoardEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/boardEnroll.jsp")
			   .forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 파일이 포함된 사용자 요청 처리 MultipartRequest 객체 생성 */
		//new MultipartRequest(HttpServletRequest request, 
							//String saveDirectory, 	// 업로드파일의 저장경로(절대경로)
							//int maxPostSize,			// 업로드파일의 최대 크기를 제한 10mb
							//String encoding,			// 인코딩
							//FileRenamePolicy policy)	// 파일 이름 재지정 정책 객체
		//application : WAS 실행시부터 종료시까지 운영되는 객체
		//application 객체로부터 getServletContext() 가져옴
		//getRealPath에 전달된 /는 web route를 의미(WebContent 디렉터리)
		String saveDirectory = getServletContext().getRealPath("/upload/board");
		System.out.println("saveDirectory@BoardEnrollServlet = " + saveDirectory);
		
		int maxPostSize = 10 * 1024 * 1024; //바이트 단위
		String encoding = "utf-8";
		//cos에서 제공하는 renamepolicy 객체. 중복파일에 대해서 덮어씌워지지 않도록 number 부여
		//FileRenamePolicy policy = new DefaultFileRenamePolicy();
		FileRenamePolicy policy = new MvcFileRenamePolicy();
		
		MultipartRequest multipartReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		
		//1.사용자 입력값으로 Board객체 생성
		String boardTitle = multipartReq.getParameter("boardTitle");
		String boardWriter = multipartReq.getParameter("boardWriter");
		String boardContent = multipartReq.getParameter("boardContent");
		//사용자의 filename
		String boardOriginalFileName = multipartReq.getOriginalFileName("upFile");
		//실제 저장될 filename
		String boardRenamedFileName = multipartReq.getFilesystemName("upFile");
		Board board = new Board(0, boardTitle, boardWriter, boardContent, boardOriginalFileName, boardRenamedFileName, null, 0);
		
		//2. 업무로직 : Board객체 db저장 요청
		System.out.println("boardServlet@ = " + board);
		int result = boardService.insertBoard(board);
		System.out.println("boardServlet@ = " + board);
		//3.사용자 피드백(msg) 및 redirect처리 (/mvc/board/boardList)
				//DML이후 반드시 요청url을 변경할 것
		HttpSession session = request.getSession();
		String msg = result > 0? "글이 등록되었습니다." : "글 등록에 실패하였습니다.";
		//board.getBoardNo()를 통해서 새로 등록된 게시글 번호 가져오기
		String location = result > 0? 
				request.getContextPath() + "/board/boardView?boardNo=" + board.getBoardNo():
				request.getContextPath() + "/board/boardList";
		
		session.setAttribute("msg", msg);
		response.sendRedirect(location);
	}
}

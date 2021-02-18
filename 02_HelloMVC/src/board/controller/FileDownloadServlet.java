package board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/board/fileDownload")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet 자체가 ServletException과 IOException을 WAS에 던질 수 있게 되어 있음.
		//따라서, IO 작업에 exception 핸들링 필요 없다. 
		
		//1. 사용자 입력값 처리
		String oName = request.getParameter("oName");
		String rName = request.getParameter("rName");
		System.out.println(rName);
		//2. 입력스트림/출력스트림
		// /WebCont/upload/board/..... -> 절대경로
		String saveDirectory = getServletContext().getRealPath("/upload/board");
		File downFile = new File(saveDirectory, rName);
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
		//응답에 대한 출력 스트림은 이미 response에 존재하기 때문에, 만들 필요 없고 가져와서 사용하면 된다.
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		//3. 응답헤더 작성 : 파일타입, 파일명
		//html로 해석하지 않게끔 함.
		response.setContentType("application/octet-stream"); //이진데이터
		//다운로드 지시. 파일 다운 받으면 파일 이름을 oName으로 하게 지시.
		//tomcat의 인코딩 iso-8859-1
		//oName을 Byte로 바꾸는데, 원래 utf-8임을 명시.
		//톰캣을 거쳐가기 위해서 iso-8859-1로 일단 변환. 여기서는 일단 한글이 깨진다.
		//깨진채로 전달해서 다시 사용할 때는 문제가 없다.
		oName = new String(oName.getBytes("utf-8"), "iso-8859-1");
		System.out.println("oName = " + oName);
		response.setHeader("Content-Disposition", "attachment;filename=" + oName);

		//4. 파일 읽어서 응답 쓰기
		int data = -1;
		while((data = bis.read()) != -1) {
			bos.write(data);;
		}

		//5. 자원반납
		bis.close();
		bos.close();
	}
}

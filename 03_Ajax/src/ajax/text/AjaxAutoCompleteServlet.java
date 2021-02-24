package ajax.text;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classmate.manager.ClassmateManager;

/**
 * Servlet implementation class AjaxAutoCompleteServlet
 */
@WebServlet("/autoComplete")
public class AjaxAutoCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자입력값 처리
		String searchName = request.getParameter("searchName");
		System.out.println("searchName = " + searchName);
		
		//2. 업무로직
		ClassmateManager manager = ClassmateManager.getInstance();
		List<String> classmates = manager.getClassmates();
		StringBuilder sb = new StringBuilder();
		for(String name : classmates) {
//			System.out.println(name);
			if(name.contains(searchName)) {
				sb.append(name);
				sb.append(",");
			}
		}
		if(sb.length() > 0)
			sb = new StringBuilder(sb.substring(0, sb.length()-1));
		System.out.println(sb);
		
		response.setContentType("text/csv; charset=utf-8");
		response.getWriter()
				.append(sb);
	}
}

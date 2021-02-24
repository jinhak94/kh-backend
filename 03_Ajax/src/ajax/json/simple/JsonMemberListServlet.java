package ajax.json.simple;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.manager.MemberManager;
import member.model.vo.Member;

/**
 * Servlet implementation class JsonMemberListServlet
 */
@WebServlet("/json/memberList")
public class JsonMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 업무로직 : 전체회원
		MemberManager manager = MemberManager.getInstance();
		List<Member> list = manager.getList();
		
		//2. json문자열로 변환 & 응답 출력
		//json-simple
		//JSONObject 객체
		//JSONArray  배열
		JSONObject sinsa = new JSONObject();
		Member m = new Member("신사임당", "01012341234", "sinsa.jpg");
		sinsa.put("name", m.getName());
		sinsa.put("phone", m.getPhone());
		sinsa.put("profile", m.getProfile());
		
		JSONObject obj = new JSONObject();
		obj.put("abced", 1234);
		obj.put("name", "홍길동");
		obj.put("member", sinsa);
		obj.put("married", true);
		obj.put("hobby", null);
		
		System.out.println(obj);
		
	}

}

package com.kh.common;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.exception.ControllerNotFoundException;
import com.kh.common.exception.MethodNotAllowedException;

/**
 * .do로 끝나는 모든 요청을 처리할 대표 Servlet
 * 사용자요청을 최초 받아서 controller 객체의 메소드를 대신 호출해준다.
 * controller는 AbstractController를 상속해 doGet/doPost를 override하도록 한다.
 */
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	Properties prop = new Properties();
	Map<String, AbstractController> urlMap = new HashMap<>();
	
	public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 1. url.properties를 읽어서 prop에 저장
	 * 2. prop 내용을 가지고 urlMap에 요소를 추가
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("---------------- DispatcherServlet.init start ---------------- ");
		//1. prop
		//src/main/resources/url.properties가 아닌
		//buildpath의 /url.properties를 읽어온다.
		String fileName = DispatcherServlet.class.getResource("/url.properties").getPath();
		System.out.println("fileName@servlet.init = " + fileName);		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//2. prop -> urlMap
		Set<String> keys = prop.stringPropertyNames();
		for(String key : keys) {
			String value = prop.getProperty(key);
			//value(class명)을 가지고 객체 생성
			try {
				//Class객체를 통한 제어 : reflection api
				Class clazz = Class.forName(value);
				AbstractController controller = 
						(AbstractController)clazz.newInstance();
				//urlMap에 요소로 추가
				urlMap.put(key, controller);
			}catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("urlMap = " + urlMap);
		System.out.println("---------------- DispatcherServlet.init end ---------------- ");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자 요청주소
		String uri = request.getRequestURI(); //mybatis/student/studentEnroll.do
		int beginIndex = request.getContextPath().length(); // /mybatis 8글자
		String url = uri.substring(beginIndex); // 다음 /를 가리킴
		
		//2. controller 호출
		AbstractController controller = urlMap.get(url);
		if(controller == null)
			throw new ControllerNotFoundException(url + "해당하는 controller가 없습니다.");		
		
		String viewName = null;
		String method = request.getMethod();
		if("GET".equals(method))
			viewName = controller.doGet(request, response);
		else if("POST".equals(method))
			viewName = controller.doPost(request, response);
		else
			throw new MethodNotAllowedException();
		//3. 응답처리 : forwarding | redirect | pass(아무것도 안함)
		if(viewName != null) {
			//redirect
			if(viewName.startsWith("redirect:")) {
				String location = request.getContextPath()
						+ viewName.replace("redirect:", "");
				response.sendRedirect(location);
			}
			//forwarding
			else {
				//prefix : 접두어, suffix : 접미어
				String prefix = "/WEB-INF/views/";
				String suffix = ".jsp";
				viewName = prefix + viewName + suffix;
				request.getRequestDispatcher(viewName)
					.forward(request, response);
			}
			//
		}
		else {
			//비동기 json 응답을 직접 처리한 경우는 아무것도 하지 않는다.
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

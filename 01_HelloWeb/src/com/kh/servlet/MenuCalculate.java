package com.kh.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MenuCalculate
 */
@WebServlet("/MenuCalculate")
public class MenuCalculate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuCalculate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mainMenu = request.getParameter("main_menu");
		String sideMenu = request.getParameter("side_menu");
		String drinkMenu = request.getParameter("drink_menu");
		int sum = 0;
		
		String mainArr[] = {"한우버거", "치즈버거", "밥버거"};
		String sideArr[] = {"감자튀김", "어니언링"};
		String drinkArr[] = {"콜라", "사이다", "커피", "밀크쉐이크"};
		
		for(int i = 0; i < mainArr.length; i++) {
			if(mainMenu.equals(mainArr[i])) {
				switch(i) {
				case 0:
					sum+=5000; break;
				case 1:
					sum+=4500; break;
				case 2:
					sum+=4000; break;
				}
			}
		}
		
		for(int i = 0; i < sideArr.length; i++) {
			if(sideMenu.contentEquals(sideArr[i])) {
				switch(i) {
				case 0:
					sum+=1500; break;
				case 1:
					sum+=1700; break;
				}
			}
		}
		
		for(int i = 0; i < drinkArr.length; i++) {
			if(drinkMenu.contentEquals(drinkArr[i])) {
				switch(i) {
				case 0:
					sum+=1000; break;
				case 1:
					sum+=1000; break;
				case 2:
					sum+=1500; break;
				case 3:
					sum+=2500; break;
				}
			}
		}

		request.setAttribute("main", mainMenu);
		request.setAttribute("side", sideMenu);
		request.setAttribute("drink", drinkMenu);
		request.setAttribute("sum", sum);
		
		RequestDispatcher reqDispatcher
			= request.getRequestDispatcher("/menu/menuResult.jsp");
		reqDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher; // Add

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		/*
		// 1단계  //  데이터를 여기서 세팅하고 jsp 파일에서 출력하는 것
	    request.setAttribute("id", "sms"); // 속성 지정
	    request.setAttribute("pass", "1111");
	    // request 에 id이름에 kbs를 저장하면 
	    //  메모리에 저장되어 있고 이동할 때는
	    //  request 가 저장되어 있는 주소값만 가지고 간다.
	    RequestDispatcher dis =
	    	    request.getRequestDispatcher("Dispatcher.jsp");
	    	    // RequestDispatcher 타입의 dis 객체(변수) 생성하고
	    	    // 컨테이너가 전달해 준 ,즉,클라이언트가 입력한 request 객체에
	    	    // 위임받은 컴포넌트 Dispatcher.jsp 를 매개변수로 저장함
	    	  
	    	    dis.forward(request,response);
	    	    // 위에서 생성된 RequestDispatcher 객체 dis 에
	    	    // forward(request,response) 메소드를 이용하여 Dispatcher.jsp 로
	    	    // request, response 내용을 전달함. 그러면 Dispatcher.jsp 에서는
	    	    //  request 객체 값을 뽑아내어 그대로 사용할 수 있음
		 */
		
		/*
		// 2단계
		response.setContentType("text/html; charset=EUC-KR");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		 
		PrintWriter out = response.getWriter();
		out.print("<h3>아이디1 : "+ id+"</h3>");
		out.print("<h3>패스1 : "+ pass+"</h3>");
		 *
		 */
		
		// 3단계
		response.setContentType("text/html; charset=EUC-KR");  
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		request.setAttribute("id", id); 
		request.setAttribute("pass", pass);
		RequestDispatcher dis =
		    request.getRequestDispatcher("Dispatcher.jsp");
		dis.forward(request,response);  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

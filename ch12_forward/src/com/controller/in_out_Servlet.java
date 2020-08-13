package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class in_out_Servlet
 */
@WebServlet("/in_out_Servlet")
public class in_out_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public in_out_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=EUC-KR");  
		float num1=Float.parseFloat(request.getParameter("num1"));
		float num2=Float.parseFloat(request.getParameter("num2"));
		request.setAttribute("num1", num1);
		request.setAttribute("num2", num2);
		request.setAttribute("numPlus", num1 + num2);
		request.setAttribute("numMinus", num1 - num2);
		request.setAttribute("numMultiply", num1 * num2);
		request.setAttribute("numDevide", num1 / num2);
		RequestDispatcher dis =
		    request.getRequestDispatcher("out_num.jsp");
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

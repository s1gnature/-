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
		// 1�ܰ�  //  �����͸� ���⼭ �����ϰ� jsp ���Ͽ��� ����ϴ� ��
	    request.setAttribute("id", "sms"); // �Ӽ� ����
	    request.setAttribute("pass", "1111");
	    // request �� id�̸��� kbs�� �����ϸ� 
	    //  �޸𸮿� ����Ǿ� �ְ� �̵��� ����
	    //  request �� ����Ǿ� �ִ� �ּҰ��� ������ ����.
	    RequestDispatcher dis =
	    	    request.getRequestDispatcher("Dispatcher.jsp");
	    	    // RequestDispatcher Ÿ���� dis ��ü(����) �����ϰ�
	    	    // �����̳ʰ� ������ �� ,��,Ŭ���̾�Ʈ�� �Է��� request ��ü��
	    	    // ���ӹ��� ������Ʈ Dispatcher.jsp �� �Ű������� ������
	    	  
	    	    dis.forward(request,response);
	    	    // ������ ������ RequestDispatcher ��ü dis ��
	    	    // forward(request,response) �޼ҵ带 �̿��Ͽ� Dispatcher.jsp ��
	    	    // request, response ������ ������. �׷��� Dispatcher.jsp ������
	    	    //  request ��ü ���� �̾Ƴ��� �״�� ����� �� ����
		 */
		
		/*
		// 2�ܰ�
		response.setContentType("text/html; charset=EUC-KR");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		 
		PrintWriter out = response.getWriter();
		out.print("<h3>���̵�1 : "+ id+"</h3>");
		out.print("<h3>�н�1 : "+ pass+"</h3>");
		 *
		 */
		
		// 3�ܰ�
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

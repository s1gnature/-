package com.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("*.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println(requestURI);   
		                 //  /ch12_frontController/insert.do
		System.out.println(contextPath);  //   /ch12_frontController
		System.out.println(command);    //    /insert.do
		
		if(command.equals("/insert.do")){
			System.out.println("insert ��û ��");
		     // �̰��� �����ϴ�  �ҽ� �ۼ��ϸ� �� - ������ insert_ok.jsp ����
		}else if(command.equals("/delete.do")){
			System.out.println("delete ��û ��");
		      // �̰��� �����ϴ�  �ҽ� �ۼ��ϸ� �� - ������ delete_ok.jsp ����
		}else if(command.equals("/update.do")){
			System.out.println("update ��û ��");
			// �̰���  �����ϴ�  �ҽ� �ۼ��ϸ� �� - ������ modify_ok.jsp ����
		}else{
			System.out.println("select ��û ��");
		     // �̰��� ��ȸ�ϴ�  �ҽ� �ۼ��ϸ� �� - ������ list_ok.jsp ����
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

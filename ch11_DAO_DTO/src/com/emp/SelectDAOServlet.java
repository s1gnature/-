package com.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SelectDAOServlet
 */
@WebServlet("/SelectDAOServlet")
public class SelectDAOServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDAOServlet() {
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
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		EmpDAO dao = new EmpDAO();
		// EmpDAO Ŭ������ dao ��ü ������.
		ArrayList<EmpDTO> list = dao.select();
		// ������ dao ��ü�� select()  ȣ����.  EmpDAO Ŭ������ 
		// select() �޼ҵ� �� ���� - ���� ��� �����͸� list ��� ���� �� ��
		// ������ ����Ʈ�� ArraryList �����̰� ������ Ÿ���� EmpDTO ������.
		// EmpDAO�� select() �޼ҵ���  30  ���� ȣ����.
		for (EmpDTO dto : list) {
			// list �� �ִ� �迭�̳� ����Ʈ ���� ��ü�� ���ʴ�� �����ͼ� 
			// EmpDTO Ÿ���� ��ü�� dto ������ ��Ƽ� ��ȯ�Ѵ�.
			String emp_id = dto.getEmp_id();
			String ename = dto.getEname();
			int salary = dto.getSalary();
			String depart = dto.getDepart();
			out.print(emp_id +"\t" + ename + "\t" + 
			salary + "\t" + depart +"<br>");
		}
		out.print("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

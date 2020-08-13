package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter; //  �߰�
import java.util.ArrayList; //  �߰�
import com.domain.EmpDTO;         // �߰�
import com.service.*;  // �߰�



/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("*.co")
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
		String requestURI = request.getRequestURI(); //  URI ���ϰ�
		//  /ch12_command/select.co
		String contextPath = request.getContextPath(); // ContextPath ����
		//  /ch12_command
		String command = requestURI.substring(contextPath.length());
		//  /select.co
		// ��ü URI ���� ContextPath ���̸�ŭ �߶󳻸� command �� ����
		if(command.equals("/insert.co")){
			System.out.println("insert ��û...");
			
			InsertService insert = new InsertService();
			String emp_id = request.getParameter("emp_id");
			String ename = request.getParameter("ename");
			int salary = Integer.parseInt(request.getParameter("salary"));
			String depart = request.getParameter("depart");

			EmpDTO dto = new EmpDTO(emp_id, ename, salary, depart);
			if (insert.execute(dto)) {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=EUC-KR");
				System.out.println("�߰� �Ϸ�");
				out.print("<html><body>");
				out.print("<tr><td>" + emp_id + " Add Success</td></tr><br><br>");
				out.print("<tr><td><a href=" + "select.co" + ">See List</a></td></tr>");
				out.print("</body></html>");
			}
			
		}else if(command.equals("/delete.co")){
			System.out.println("Delete ��û...");
		}else if(command.equals("/update.co")){
			System.out.println("Update ��û...");
			// ��ȸ�ϱ�(select.co) �̹Ƿ� ��ȸ �ϴ� �ҽ� �ۼ���.
		}else if(command.equals("/select.co")){
			System.out.println("Select ��û...");
			response.setContentType("text/html; charset=EUC-KR");
			PrintWriter out = response.getWriter();
			out.print("<html><body>");
			SelectService service = new SelectService();
			 // ���� import �� SelectService Ŭ������ service ��ü ����
			 // SelectService  Ŭ���� ������
			 
			 ArrayList<EmpDTO> list = service.execute();
			 // SelectService �� ������ EmpDAO�� select() ���� �� �̰����� ����
			 // service.execute()�� ������ �� ����� list �� ����

			 for (EmpDTO dto : list) {
			// list �� �ִ� �迭�̳� ����Ʈ ���� ��ü�� ���ʴ�� �����ͼ� 
			// EmpDTO Ÿ���� ��ü�� dto ������ ��Ƽ� ��ȯ�Ѵ�.
				 String emp_id = dto.getEmp_id();
				 // DTO ���� ���� �̾Ƴ��� ������ ���� 
				 String ename = dto.getEname();
				 int salary = dto.getSalary();
				 String depart = dto.getDepart();
				 out.print(emp_id +"\t" + ename + "\t" + salary + "\t" +  depart +"<br>");
			}
			 out.print("</body></html>");
		}else { }
	} // end doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

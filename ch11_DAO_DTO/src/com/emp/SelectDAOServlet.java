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
		// EmpDAO 클래스의 dao 객체 생성함.
		ArrayList<EmpDTO> list = dao.select();
		// 생성된 dao 객체의 select()  호출함.  EmpDAO 클래스의 
		// select() 메소드 가 보면 - 여러 사람 데이터를 list 담아 리턴 해 줌
		// 생성된 리스트는 ArraryList 형태이고 데이터 타입은 EmpDTO 형식임.
		// EmpDAO의 select() 메소드의  30  라인 호출함.
		for (EmpDTO dto : list) {
			// list 에 있는 배열이나 리스트 같은 객체를 차례대로 가져와서 
			// EmpDTO 타입의 객체인 dto 변수에 담아서 반환한다.
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

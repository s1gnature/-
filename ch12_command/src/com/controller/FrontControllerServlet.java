package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter; //  추가
import java.util.ArrayList; //  추가
import com.domain.EmpDTO;         // 추가
import com.service.*;  // 추가



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
		String requestURI = request.getRequestURI(); //  URI 구하고
		//  /ch12_command/select.co
		String contextPath = request.getContextPath(); // ContextPath 구함
		//  /ch12_command
		String command = requestURI.substring(contextPath.length());
		//  /select.co
		// 전체 URI 에서 ContextPath 길이만큼 잘라내면 command 만 남음
		if(command.equals("/insert.co")){
			System.out.println("insert 요청...");
			
			InsertService insert = new InsertService();
			String emp_id = request.getParameter("emp_id");
			String ename = request.getParameter("ename");
			int salary = Integer.parseInt(request.getParameter("salary"));
			String depart = request.getParameter("depart");

			EmpDTO dto = new EmpDTO(emp_id, ename, salary, depart);
			if (insert.execute(dto)) {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=EUC-KR");
				System.out.println("추가 완료");
				out.print("<html><body>");
				out.print("<tr><td>" + emp_id + " Add Success</td></tr><br><br>");
				out.print("<tr><td><a href=" + "select.co" + ">See List</a></td></tr>");
				out.print("</body></html>");
			}
			
		}else if(command.equals("/delete.co")){
			System.out.println("Delete 요청...");
		}else if(command.equals("/update.co")){
			System.out.println("Update 요청...");
			// 조회하기(select.co) 이므로 조회 하는 소스 작성됨.
		}else if(command.equals("/select.co")){
			System.out.println("Select 요청...");
			response.setContentType("text/html; charset=EUC-KR");
			PrintWriter out = response.getWriter();
			out.print("<html><body>");
			SelectService service = new SelectService();
			 // 위에 import 한 SelectService 클래스의 service 객체 생성
			 // SelectService  클래스 가보면
			 
			 ArrayList<EmpDTO> list = service.execute();
			 // SelectService 에 가보면 EmpDAO의 select() 실행 후 이곳으로 리턴
			 // service.execute()를 실행한 후 결과를 list 에 저장

			 for (EmpDTO dto : list) {
			// list 에 있는 배열이나 리스트 같은 객체를 차례대로 가져와서 
			// EmpDTO 타입의 객체인 dto 변수에 담아서 반환한다.
				 String emp_id = dto.getEmp_id();
				 // DTO 에서 값을 뽑아내어 변수에 저장 
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

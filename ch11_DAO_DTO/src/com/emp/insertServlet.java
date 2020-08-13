package com.emp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.PrintWriter;

/**
 * Servlet implementation class insertServlet
 */
@WebServlet("/insertServlet")
public class insertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("EUC-KR");
		String emp_id = request.getParameter("emp_id");
		String ename  = request.getParameter("ename");
		String salary = request.getParameter("salary");
		String depart = request.getParameter("depart");
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		 String driver = "oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String userid = "sms226";
		String passwd = "pass123";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, passwd);
		String sql = "insert into emp ( emp_id, ename, salary, depart) values " +  " ( ? , ? , ? , ? )";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, emp_id );
		pstmt.setString(2, ename );
		pstmt.setInt(3, Integer.parseInt(salary) );
		pstmt.setString(4, depart );
		int n = pstmt.executeUpdate();
		if( n == 1){
			out.print("저장 성공");
		}else{
			out.print("저장 실패");
		}
		} catch (Exception e) {
			out.print("exception");
			e.printStackTrace();
			}finally{
				try {
					if(pstmt!=null) pstmt.close();
					if(con!=null) con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		out.print("</body></html>");
	}//end doPost
}

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%
	String id=null;	
	String delete_id=request.getParameter("id");
	String driver="oracle.jdbc.driver.OracleDriver";  
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
		Class.forName(driver);  
	    conn=DriverManager.getConnection(url,"sms226","pass123");
		
		pstmt=conn.prepareStatement("Update member Set status=0 WHERE id=?");
		// status
		pstmt.setString(1,delete_id);
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("location.href='memberList.jsp'");
			out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
	}
%>

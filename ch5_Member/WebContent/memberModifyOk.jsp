<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>

<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String driver="oracle.jdbc.driver.OracleDriver";  //����̹� �̸� ����
 	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	try {			
  		Class.forName(driver);  //����̹� �̸����� ����̹��� �ε�
	    conn=DriverManager.getConnection(url,"sms226","pass123");	 		
  		String SQL="update member set ";
  		       SQL=SQL + "pass = ?";
  		       SQL=SQL + ",name = ?";
  		       SQL=SQL + ",age = ?";
  		       SQL=SQL + ",gender = ?";
  		       SQL=SQL + ",email = ?";
  		       SQL=SQL + "where id=?";
  		       
        pstmt=conn.prepareStatement(SQL); 		
  		pstmt.setString(1,pass);
  		pstmt.setString(2,name);
  		pstmt.setInt(3,age);
  		pstmt.setString(4,gender);
  		pstmt.setString(5,email);
  		pstmt.setString(6,id);	  		
  		int result=pstmt.executeUpdate();	
  		if(result!=0){  			
  			out.println("���� �Ϸ�");
  		}else{
  			out.println("���� �ȵ�");  	  		
  		}
	}catch(Exception e){
		e.printStackTrace();
 	}
%>
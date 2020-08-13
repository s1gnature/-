<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>   
<%@ page import="javax.naming.*" %>    

<%
	request.setCharacterEncoding("euc-kr");
	String deleteValue=request.getParameter("deleteqnum");
	String sqlString = "DELETE FROM QUIZ WHERE Q_NUM=" + deleteValue;
	
	Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;

    String driver="oracle.jdbc.driver.OracleDriver";  
    String url="jdbc:oracle:thin:@localhost:1521:orcl";

// 로그인 하지 않았거나(세션값이 없으면)  또는 관리자가 아니면 
   // memberLogin.jsp 로 가라.  
   // 바로 memberList.jsp를 실행하면 memberLogin.jsp 로 튕겨나감

           // 정상적으로 로그인 하고 들어오면 이곳 수행
   		try {
   		Class.forName(driver);  
   		conn=DriverManager.getConnection(url,"sms226","pass123");
   		pstmt=conn.prepareStatement(sqlString);
   		rs=pstmt.executeQuery();
   		}catch(Exception e){
   		e.printStackTrace();
   		}

   		out.println("<script>");
   	    out.println("location.href='Add_Quiz.jsp'");
   	    out.println("</script>");
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>   
<%@ page import="javax.naming.*" %>    
    
<%
	request.setCharacterEncoding("euc-kr");
	String Q_QUESTION=request.getParameter("Q_QUESTION");
	String Q_IMAGE=request.getParameter("Q_IMAGE");
	String Q_TYPE=request.getParameter("Q_TYPE");
	String Q_EX1=request.getParameter("Q_EX1");
	String Q_EX2=request.getParameter("Q_EX2");
	String Q_EX3=request.getParameter("Q_EX3");
	String Q_EX4=request.getParameter("Q_EX4");
	String Q_ANSWER=request.getParameter("Q_ANSWER");
	
	Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;

   String driver="oracle.jdbc.driver.OracleDriver";  
   String url="jdbc:oracle:thin:@localhost:1521:orcl";
   		try {
   		Class.forName(driver);  
   		conn=DriverManager.getConnection(url,"sms226","pass123");
   		String sqlString="Insert into QUIZ(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(auto_increase.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
   		pstmt=conn.prepareStatement(sqlString); 
   		if(Q_TYPE.equals("IT")){
   			Q_QUESTION=Q_QUESTION + "<br> <img src=\"image/" + Q_IMAGE + "\"";
   			Q_TYPE="TT";
   		}
   		pstmt.setString(1,Q_QUESTION);
   		pstmt.setString(2,Q_TYPE);
   		pstmt.setString(3,Q_EX1);
   		pstmt.setString(4,Q_EX2);
   		pstmt.setString(5,Q_EX3);
   		pstmt.setString(6,Q_EX4);
   		pstmt.setString(7,Q_ANSWER);
   		int result=pstmt.executeUpdate();
   		}catch(Exception e){
   		e.printStackTrace();
   		}
	        
	pstmt.close(); 
	conn.close(); 
	out.println("<script>");
    out.println("location.href='Add_Quiz.jsp'");
    out.println("</script>");
%>
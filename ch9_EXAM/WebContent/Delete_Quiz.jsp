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

// �α��� ���� �ʾҰų�(���ǰ��� ������)  �Ǵ� �����ڰ� �ƴϸ� 
   // memberLogin.jsp �� ����.  
   // �ٷ� memberList.jsp�� �����ϸ� memberLogin.jsp �� ƨ�ܳ���

           // ���������� �α��� �ϰ� ������ �̰� ����
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
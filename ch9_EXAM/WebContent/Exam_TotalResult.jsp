<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%
    request.setCharacterEncoding("euc-kr");

     String id=null;
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
    		pstmt=conn.prepareStatement("SELECT * FROM SCORE");
    		rs=pstmt.executeQuery();
    		}catch(Exception e){
    		e.printStackTrace();
    		}
    		
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>SCORE LIST</title>
</head>
<body>
<center>
<tr><td style="font-weight: bold;"><font size="8"; weight="bold";>SCORE LIST</font></td></tr>
<table border=1 width=500>
	<tr style="background-color: Silver; font-weight: bold"><td>�й�</td><td>�̸�</td><td>����</td><td>����ð�</td>
	<% while(rs.next()){ %>
	<tr><td><%=rs.getString("S_NUM") %></td><td><%=rs.getString("S_NAME")%></td><td><%=rs.getString("S_GRADE") %></td><td><%=rs.getString("Q_INDATE")%></td>
	<%} %>
</table>
</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>

<%
request.setCharacterEncoding("euc-kr");
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver"; 
String url="jdbc:oracle:thin:@localhost:1521:orcl";

try {
	Class.forName(driver);  
	conn=DriverManager.getConnection(url,"sms226","pass123");
	// ���� SQL  ����Ϸ��� �� ���Ϻ��� �ٽ� �߰� �Ͽ� ����ϸ� ��.

	pstmt=conn.prepareStatement("SELECT * FROM emp");
	// order by indate desc  �ֱ� ���� �� ���� ǥ����
	rs=pstmt.executeQuery();
}catch(Exception e){
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr><td>���̵�</td><td>�̸�</td><td>�޿�</td><td>�μ�</td></tr>
<% while(rs.next()){ %>
	<tr><td><%=rs.getString("emp_id")%></td><td><%=rs.getString("ename")%></td><td><%=rs.getString("salary")%></td><td><%=rs.getString("depart")%></td></tr>
<% } %>
</table><br><br>
<tr><td border=2> DB���� ���������� �˻� �Ǿ����ϴ�!!!</td></tr>
</body>
</html>
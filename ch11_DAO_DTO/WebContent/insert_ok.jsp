<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>

<%
request.setCharacterEncoding("euc-kr");
String emp_id=request.getParameter("emp_id");
String ename=request.getParameter("ename");
int salary=Integer.parseInt(request.getParameter("salary"));
String depart=request.getParameter("depart");

Connection conn=null;
String driver="oracle.jdbc.driver.OracleDriver";  
String url="jdbc:oracle:thin:@localhost:1521:orcl";  
Class.forName(driver);  
conn=DriverManager.getConnection(url,"sms226","pass123");
String insertQuery = "insert into emp(emp_id, ename, salary, depart) values (?,?,?,?)";
PreparedStatement pstmt=conn.prepareStatement(insertQuery); 

pstmt.setString(1, emp_id);
pstmt.setString(2, ename);
pstmt.setInt(3, salary);
pstmt.setString(4, depart);

pstmt.executeUpdate();
pstmt.close();
conn.close();
%>

<html>
<body>
<tr><td>저장 성공</td></tr>
<br><br>
<tr><td><a herf="select.jsp">리스트 보기</a></td></tr>
</body>
</html>
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
	// 여러 SQL  사용하려면 이 이하부터 다시 추가 하여 사용하면 됨.

	pstmt=conn.prepareStatement("SELECT * FROM emp");
	// order by indate desc  최근 글이 맨 위로 표시함
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
<tr><td>아이디</td><td>이름</td><td>급여</td><td>부서</td></tr>
<% while(rs.next()){ %>
	<tr><td><%=rs.getString("emp_id")%></td><td><%=rs.getString("ename")%></td><td><%=rs.getString("salary")%></td><td><%=rs.getString("depart")%></td></tr>
<% } %>
</table><br><br>
<tr><td border=2> DB에서 정상적으로 검색 되었습니다!!!</td></tr>
</body>
</html>
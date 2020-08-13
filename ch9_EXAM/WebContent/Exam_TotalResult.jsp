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

 // 로그인 하지 않았거나(세션값이 없으면)  또는 관리자가 아니면 
    // memberLogin.jsp 로 가라.  
    // 바로 memberList.jsp를 실행하면 memberLogin.jsp 로 튕겨나감

            // 정상적으로 로그인 하고 들어오면 이곳 수행
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
	<tr style="background-color: Silver; font-weight: bold"><td>학번</td><td>이름</td><td>성적</td><td>제출시간</td>
	<% while(rs.next()){ %>
	<tr><td><%=rs.getString("S_NUM") %></td><td><%=rs.getString("S_NAME")%></td><td><%=rs.getString("S_GRADE") %></td><td><%=rs.getString("Q_INDATE")%></td>
	<%} %>
</table>
</center>
</body>
</html>
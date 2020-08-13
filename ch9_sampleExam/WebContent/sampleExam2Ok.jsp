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
    		pstmt=conn.prepareStatement("SELECT * FROM sihyeomMunje");
    		rs=pstmt.executeQuery();
    		}catch(Exception e){
    		e.printStackTrace();
    		}
%>
<%
	 request.setCharacterEncoding("euc-kr");
     String cntString=request.getParameter("cnt");
     int cnt=Integer.parseInt(cntString);
     
     int score=0;
     int index=1;
     while(rs.next()){
    	 String answer=request.getParameter("answer"+index);
    	 String dap=rs.getString("dap");
    	 if(answer.equals(dap)){
    		 score++;
    	 }
    	 index++;
     }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table align=center>
<center>
<tr><td align=center style="font-weight:bold">시험 결과</td></tr>
<%for(int i=1; i<=cnt; i++){ 
String answer = request.getParameter("answer"+ i); %>
<tr><td align=center><%=i%>&nbsp;<%=answer %></td></tr>

<%} %>
<tr><td>당신의 점수는 <%=score %> 점 입니다.</td></tr>
</center>
</table>
</body>
</html>
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
<tr><td align=center style="font-weight:bold">���� ���</td></tr>
<%for(int i=1; i<=cnt; i++){ 
String answer = request.getParameter("answer"+ i); %>
<tr><td align=center><%=i%>&nbsp;<%=answer %></td></tr>

<%} %>
<tr><td>����� ������ <%=score %> �� �Դϴ�.</td></tr>
</center>
</table>
</body>
</html>
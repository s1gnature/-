<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%! 
String Check(String s, String c){
	if (c.equals("TT")){
		if(s==null) return "";
		else return s;
	}else{
		return "<img src=\"image\\" + s + "\" style=\"max-width :70; height: auto;\"/>";
	}
}
%>
<%
	 request.setCharacterEncoding("euc-kr");
     String cntString=request.getParameter("cnt");
     String s_num=request.getParameter("s_num");
     String s_name=request.getParameter("s_name");
     ResultSet q_rs= (ResultSet) request.getAttribute("q_rs");
     int cnt=Integer.parseInt(cntString);
     
     int score=0;
     int index=1;
     while(index != Integer.parseInt(cntString)){
    	 String answer = "";
    	 if(request.getParameter("answer"+index) == null){
    		answer="notExist";
    	 }else{
    	 	answer=request.getParameter("answer"+index);
    	 }
    	 String dap=request.getParameter("Q_ANSWER"+index);
    	 if(answer.equals(dap)){
    		 score++;
    	 }
    	 index++;
     }

%>
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
    		pstmt=conn.prepareStatement("Insert into SCORE values(?, ?, ?, DEFAULT)");
    		pstmt.setString(1,s_num);
    		pstmt.setString(2,s_name);
    		pstmt.setString(3,String.valueOf(score));
    		int result=pstmt.executeUpdate();
    		}catch(Exception e){
    		e.printStackTrace();
    		}
    		
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���</title>
</head>
<body>
<center>
<tr><td style="font-weight: bold;"><font size="6"; weight="bold";>���� ���</font></td></tr>
<table border=1 aline="center">
<tr><td>�й�</td><td><%=s_num %></td></tr>
<tr><td>�̸�</td><td><%=s_name %></td></tr>
<tr><td>����</td><td><%=score %></td></tr>
<tr><td colspan=2><a href="Exam_TotalResult.jsp">���� ����Ʈ ����</a></td></tr>


</center>
</body>
</html>
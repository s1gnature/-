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

 // 로그인 하지 않았거나(세션값이 없으면)  또는 관리자가 아니면 
    // memberLogin.jsp 로 가라.  
    // 바로 memberList.jsp를 실행하면 memberLogin.jsp 로 튕겨나감

            // 정상적으로 로그인 하고 들어오면 이곳 수행
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
<title>시험 결과</title>
</head>
<body>
<center>
<tr><td style="font-weight: bold;"><font size="6"; weight="bold";>시험 결과</font></td></tr>
<table border=1 aline="center">
<tr><td>학번</td><td><%=s_num %></td></tr>
<tr><td>이름</td><td><%=s_name %></td></tr>
<tr><td>점수</td><td><%=score %></td></tr>
<tr><td colspan=2><a href="Exam_TotalResult.jsp">점수 리스트 보기</a></td></tr>


</center>
</body>
</html>
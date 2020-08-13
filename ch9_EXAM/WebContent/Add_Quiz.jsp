<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>   
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
<center>
<tr><td style="font-weight: bold;"><font size="6"; weight="bold";>문제 추가</font></td></tr>
</center>
<form name="Add_Quiz" action="Add_QuizOK.jsp" method="post">
<%-- <table border=1 align="center">--%>
	<tr>
	<td>문제 타입</td>
	<td border=0><select name="Q_TYPE">
		<option value="TT" selected="selected">TT</option>
		<option value="IT">IT</option>
		<option value="TI">TI</option>
	</select></td><br><br>
	</tr>
	<tr>
	<td>문제</td>
	<td width=><input type="text" name="Q_QUESTION"></td>&nbsp;&nbsp;
	<td>문제 이미지</td><td><input type="text" name="Q_IMAGE"></td><br><br>
	</tr>
	<tr>
	<td>보기 1번</td><td><input type="text" name="Q_EX1"></td>&nbsp;
	<td>보기 2번</td><td><input type="text" name="Q_EX2"></td>&nbsp;
	<td>보기 3번</td><td><input type="text" name="Q_EX3"></td><br><br>
	</tr>
	<tr>
	<td>보기 4번</td><td><input type="text" name="Q_EX4"></td>&nbsp;
	<td>정답</td><td><input type="text" name="Q_ANSWER"></td><br><br>
	</tr>
	<center>
	<tr><td><input type="submit" value="문제 추가"></td></tr>
	</center>
<%-- </table> --%>
</form>
<%---------- 문제 추가 테이블 끝 ------------%>
<br><br><br><br><br>
<center>
<td style="font-weight: bold;"><font size="5"; weight="bold";>문제 확인, 삭제</font></td>
</center>
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
    		pstmt=conn.prepareStatement("SELECT * FROM QUIZ order by Q_NUM asc");
    		rs=pstmt.executeQuery();
    		}catch(Exception e){
    		e.printStackTrace();
    		}
%>
<table border=0 width=1000>
	<%
	int cnt=1;
	while(rs.next()) { 
		String Q_NUM = rs.getString("Q_NUM");
		String bg1 = rs.getString("Q_EX1");
		String bg2 = rs.getString("Q_EX2");
		String bg3 = rs.getString("Q_EX3");
		String bg4 = rs.getString("Q_EX4");
		String q_answer = rs.getString("Q_ANSWER");
		String Q_IMAGE = rs.getString("Q_IMAGE");
		String TYPE_Q = rs.getString("Q_TYPE");%>
		<tr><td colspan=10><hr></tr>
	<tr><td width=150>문제 타입 : <%=TYPE_Q %></td>&nbsp;&nbsp;&nbsp;<td colspan=5>문제 : <%=rs.getString("Q_QUESTION")%></td></tr><br><br>
	<tr><td rowspan=5><a href="Delete_Quiz.jsp?deleteqnum=<%=Q_NUM%>">삭제</a></td></tr>
	<td>보기 1번 : <%=Check(bg1, TYPE_Q) %></td>
	<td>보기 2번 : <%=Check(bg2, TYPE_Q)%></td>
	</tr>
	<tr>
	<td>보기 3번 : <%=Check(bg3, TYPE_Q)%></td>
	<td>보기 4번 : <%=Check(bg4, TYPE_Q)%></td><br><br>
	</tr><tr></tr>
	<tr>
	<td style="font-weight:bold">정답 : <%=q_answer%></td>
	</tr>
	<%cnt++;} %>
</table>
</body>
</html>
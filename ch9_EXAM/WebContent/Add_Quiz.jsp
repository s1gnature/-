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
<tr><td style="font-weight: bold;"><font size="6"; weight="bold";>���� �߰�</font></td></tr>
</center>
<form name="Add_Quiz" action="Add_QuizOK.jsp" method="post">
<%-- <table border=1 align="center">--%>
	<tr>
	<td>���� Ÿ��</td>
	<td border=0><select name="Q_TYPE">
		<option value="TT" selected="selected">TT</option>
		<option value="IT">IT</option>
		<option value="TI">TI</option>
	</select></td><br><br>
	</tr>
	<tr>
	<td>����</td>
	<td width=><input type="text" name="Q_QUESTION"></td>&nbsp;&nbsp;
	<td>���� �̹���</td><td><input type="text" name="Q_IMAGE"></td><br><br>
	</tr>
	<tr>
	<td>���� 1��</td><td><input type="text" name="Q_EX1"></td>&nbsp;
	<td>���� 2��</td><td><input type="text" name="Q_EX2"></td>&nbsp;
	<td>���� 3��</td><td><input type="text" name="Q_EX3"></td><br><br>
	</tr>
	<tr>
	<td>���� 4��</td><td><input type="text" name="Q_EX4"></td>&nbsp;
	<td>����</td><td><input type="text" name="Q_ANSWER"></td><br><br>
	</tr>
	<center>
	<tr><td><input type="submit" value="���� �߰�"></td></tr>
	</center>
<%-- </table> --%>
</form>
<%---------- ���� �߰� ���̺� �� ------------%>
<br><br><br><br><br>
<center>
<td style="font-weight: bold;"><font size="5"; weight="bold";>���� Ȯ��, ����</font></td>
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

 // �α��� ���� �ʾҰų�(���ǰ��� ������)  �Ǵ� �����ڰ� �ƴϸ� 
    // memberLogin.jsp �� ����.  
    // �ٷ� memberList.jsp�� �����ϸ� memberLogin.jsp �� ƨ�ܳ���

            // ���������� �α��� �ϰ� ������ �̰� ����
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
	<tr><td width=150>���� Ÿ�� : <%=TYPE_Q %></td>&nbsp;&nbsp;&nbsp;<td colspan=5>���� : <%=rs.getString("Q_QUESTION")%></td></tr><br><br>
	<tr><td rowspan=5><a href="Delete_Quiz.jsp?deleteqnum=<%=Q_NUM%>">����</a></td></tr>
	<td>���� 1�� : <%=Check(bg1, TYPE_Q) %></td>
	<td>���� 2�� : <%=Check(bg2, TYPE_Q)%></td>
	</tr>
	<tr>
	<td>���� 3�� : <%=Check(bg3, TYPE_Q)%></td>
	<td>���� 4�� : <%=Check(bg4, TYPE_Q)%></td><br><br>
	</tr><tr></tr>
	<tr>
	<td style="font-weight:bold">���� : <%=q_answer%></td>
	</tr>
	<%cnt++;} %>
</table>
</body>
</html>
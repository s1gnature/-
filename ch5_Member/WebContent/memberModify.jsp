<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>

<%@ page import="javax.naming.*" %>
<%
	String id=null;	
	String info_id=request.getParameter("id");	
	String driver="oracle.jdbc.driver.OracleDriver";  //����̹� �̸� ����
 	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {				
		Class.forName(driver);  //����̹� �̸����� ����̹��� �ε�
	    conn=DriverManager.getConnection(url,"sms226","pass123");
						pstmt=conn.prepareStatement("SELECT * FROM member WHERE id=?");
			pstmt.setString(1,info_id);
			rs=pstmt.executeQuery();		
			rs.next();				
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<html><head>
<title>ȸ�� ���� �����ϱ�</title>
</head><body>
<form name="modifyform" action="memberModifyOk.jsp" method="post">
<center><table border=1 width=300>
<caption> �� ���� �����ϱ� </caption>    
	<tr align=center><td>���̵� : </td>   <td> <input type="text"  name="id" VALUE="<%=rs.getString("id")  %>"> </td> </tr>
	<tr align=center><td>��й�ȣ : </td>  <td> <input type="text"  name="pass" VALUE="<%=rs.getString("pass") %>"> </td> </tr>
	<tr align=center><td>�̸� : </td>    <td> <input type="text"  name="name" VALUE="<%=rs.getString("name") %>"> </td> </tr>

	<tr align=center><td>���� : </td>    <td> <input type="text"  name="age" VALUE="<%=rs.getString("age") %>"> </td> </tr>
	<tr align=center><td>���� : </td>    <td> <input type="text"  name="gender" VALUE="<%=rs.getString("gender") %>"> </td> </tr>
	<tr align=center><td>�̸��� �ּ� : </td><td> <input type="text"  name="email" VALUE="<%=rs.getString("email") %>"> </td> </tr>
	<tr align=center><td colspan=2>
		<a href="javascript:modifyform.submit()">�� ���� �����ϱ�</a>&nbsp;&nbsp;
			<a href="javascript:modifyform.reset()">�ٽ��ۼ�</a></td>	</tr>
</table></center></body></html>
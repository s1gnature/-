<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%
 request.setCharacterEncoding("euc-kr");
 int num=Integer.parseInt(request.getParameter("num"));
    // �Ѱ��� �� �� ��ȣ ������ ����
 String pass=request.getParameter("pass");
    // �Ѱ��� �� ��й�ȣ ������ ����
%>
<%
String driver="oracle.jdbc.driver.OracleDriver";  //����̹� �̸� ����
 String url="jdbc:oracle:thin:@localhost:1521:orcl";
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
Class.forName(driver);  //����̹� �̸����� ����̹��� �ε�   
conn=DriverManager.getConnection(url,"sms226","pass123");

pstmt=conn.prepareStatement("SELECT * FROM memo_Test WHERE num=?");
pstmt.setInt(1,num);    // �� ��ȣ�� ������ �ҷ� �Ͷ�
rs=pstmt.executeQuery();
if(rs.next()){
     if(pass.equals(rs.getString("pass")))
     {  // �۹�ȣ�� ��й�ȣ�� ������  ���� �� memo.jsp �� ��
		pstmt=conn.prepareStatement("DELETE FROM memo_Test WHERE num=?");
		pstmt.setInt(1,num);    
		pstmt.executeUpdate();     out.println("<script>");
		out.println("location.href='memo.jsp'");     out.println("</script>");
   }
	else   //  �۹�ȣ�� ��й�ȣ�� Ʋ���� �ٷ�  memo.jsp �� ��
	{
		%>
	    <script language="javascript">
		alert("��й�ȣ�� Ȯ���� �ּ���.");
		</script>
	    <%
		out.println("<script>");
		out.println("location.href='memo.jsp'");     out.println("</script>");
	}
}
%>

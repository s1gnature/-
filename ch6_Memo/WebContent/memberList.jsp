<%--
 <%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>  
<%@ page import="javax.sql.* " %>
<%@ page import="javax.naming.*" %>
<%
int i=0;  
String sql="SELECT * FROM member";
String driver="oracle.jdbc.driver.OracleDriver"; 
String url="jdbc:oracle:thin:@localhost:1521:orcl";
try {
Class.forName(driver); 
Connection con = 
               DriverManager.getConnection(url, "kbs123","pass123");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>


<body> <center>
 <h4> [ ȸ������Ʈ ] </h4>
 <table border="1" cellspacing="1">
    <tr> <th>NO</th> <th>ID</th> <th>PASS</th> <th>�̸�</th><th>����</th><th>����</th><th>�̸���</th><th>����</th></tr>
<%
    // 6�ܰ�: ��� ��  �ݺ� ó��
    while ( rs.next() )  {
%><tr> <td><%= ++i %></td>
           <td><%= rs.getString(1) %> </td> 
           <td><%= rs.getString(2) %> </td> 
            <td><%= rs.getString(3) %> </td>    
           <td><%= rs.getInt(4) %> </td>
           <td><%= rs.getString(5) %> </td>  
            <td><%= rs.getString(6) %> </td> 
             <td><%= rs.getInt(7) %> </td>   
  </tr>
<%
 }
 %>
 </table> 

 <% // 7�ܰ�: ����� �ڿ� ����
 rs.close();
 stmt.close();
 con.close();
%>
 <h4>DB���� ���������� �˻� �Ǿ����ϴ�!!!</h4>
<%
 } catch (SQLException e) {
%>
   <h4>������ �߻� �߱���. �ٽ� Ȯ���� ������!!!</h4>
<% 
} 
%>
</center>
</body></html> 

--%>



<!-- 
// =================================================== 
======================================================
======================================================
-->

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

    if ((session.getAttribute("id")==null) || 
    	  (!((String)session.getAttribute("id")).equals("admin"))) {
    		out.println("<script>");
    		out.println("location.href='memberLogin.jsp'");
    		out.println("</script>");
    		}

            // ���������� �α��� �ϰ� ������ �̰� ����
    		try {
    		Class.forName(driver);  
    		conn=DriverManager.getConnection(url,"sms226","pass123");
    		pstmt=conn.prepareStatement("SELECT * FROM member where status=0");
    		rs=pstmt.executeQuery();
    		}catch(Exception e){
    		e.printStackTrace();
    		}
    		%>
    		

<body>
<center>
<table border=1 width=500>
<tr align=center><td colspan=4>���� ȸ�� ���</td></tr>
<tr align=center><td>���̵� </td><td>�̸� </td><td>  </td><td>  </td></tr>
<%while(rs.next()) { %>
<tr align=center>
<td><a href="memberInfo.jsp?id=<%=rs.getString("id") %>">
<!-- �Ƶ� Ŭ���ϸ� memberInfo.jsp�� ���µ� id���� ������ ����  -->
<%=rs.getString("id") %>   </a></td>
<%-- <%=rs.getString("id") %>�ּ� ó���ϰ� ���� �� �� �� --%>
<td><%=rs.getString("name") %></a></td>
    		
    		
<td><a href="memberBad.jsp?id=<%=rs.getString("id") %>">�ҷ�ȸ�� ����ϱ�</a></td>
<!-- �ҷ�ȸ���� Ŭ���ϸ� memberDelete.jsp�� ���µ� id ���� ������ ����  -->

<!-- ���� �� Ŭ���ϸ� memberExit.jsp�� ���µ� id ���� ������ ����  -->
<td><a href="memberExit.jsp?id=<%=rs.getString("id") %>">���� ����</a>
</td></tr>
<% }  %>
</table>
<table border=1 width=500>
<tr align=center><td>
<a href="memberBadList.jsp">�ҷ� ȸ�� ����Ʈ ����</a></td></tr>
</table>  </center>
</body>
    		


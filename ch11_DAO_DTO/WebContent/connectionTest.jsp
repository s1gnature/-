<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.sql.*" %>  <!-- �߰� -->
 <%@ page import="javax.naming.*" %> <!-- �߰� -->
 <%@ page import="javax.sql.DataSource" %> <!-- �߰� -->

<%
 Connection conn=null;
 try {
 	Context ctx = new InitialContext(); 
    // DataSource ��ü�� ��� ���� ��ü ����
	// InitialContext��ü  ctx ����(Context �� ��� ����)
	DataSource dataFactory=(DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
 //  JNDI ���� ������ �ʱ� ROOT���丮 ��� ��������
//  lookup�ؼ� �� WAS ������ ���� ��Ʈ ���丮�� ��´� 
// ��Ĺ�� ��Ʈ ���丮�� "java:comp/env"  
// JNDI name��    dbc/Oracle11g
//  context.xml �� ����� jdbc/Oracle11g�� ���̹��� lookup (���´�)
// ��Ĺ�� context.xml �� ����� ���̹����� DataSource �� ��´�. 
 // Connection Pool ������, �ݳ��ϴ� ������ ��. 
// Object Ÿ���̹Ƿ� ����ȯ�� �� (DataSource) 
 // ���� DriverManager ����� static �� �ʵ带 ����ϹǷ� Thread ȯ�濡���� ��������
    conn = dataFactory.getConnection();
// Ŀ�ؼ�pool ���� ��Ĺ ������ ������ ���� Connection ���� ����
 // dataFactory �� DataSource�� Context.xml ��  "javax.sql.DataSource�� �� 
 // dataFactory ��ü�κ��� Connection ��ü�� ���´�.
 // ���� ���� ���ʹ� �� ��ü�� �� �����̳��� DB �� ���ӵ�.
 	out.println("<h3>  DBCP Connection pool success . </h3>");
 } catch(Exception e) {
 	out.println("<h3>  DBCP Connection pool fail . </h3>");
 	e.printStackTrace();
 }
 if(conn != null){ conn.close(); }
//Ŀ�ؼ� Ǯ�� ����� Ŀ�ؼ� ��ü �ٽ� �ݳ� (���⼭�� �޸� ������ �ƴ�)
%>
           
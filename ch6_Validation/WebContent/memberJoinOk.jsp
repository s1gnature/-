<!-- 
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>   
<%@ page import="javax.naming.*" %>
 -->
 
<%
/*
request.setCharacterEncoding("euc-kr");

String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
int age=Integer.parseInt(request.getParameter("age"));
String gender=request.getParameter("gender");
String email=request.getParameter("email");
 int status=0; 
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

String driver="oracle.jdbc.driver.OracleDriver";  //����̹� �̸� ����
String url="jdbc:oracle:thin:@localhost:1521:orcl";

  Class.forName(driver);  //����̹� �̸����� ����̹��� �ε�
  conn=DriverManager.getConnection(url,"sms226","pass123");
pstmt=conn.prepareStatement("INSERT INTO member VALUES(?,?,?,?,?,?,?)");
  pstmt.setString(1,id);
  pstmt.setString(2,pass);
  pstmt.setString(3,name);
  pstmt.setInt(4,age);
  pstmt.setString(5,gender);
  pstmt.setString(6,email);
  pstmt.setInt(7,status); 
  int result=pstmt.executeUpdate();
  if(result!=0)
  {  
      out.println("<script>");
      out.println("location.href='memberLogin.jsp'");
      out.println("</script>");
    }
  else
  {
      out.println("<script>");
      out.println("location.href='memberJoin.jsp'");
      out.println("</script>");
   }
  */
  %>
  
  <!-- ########################################################################### -->
  
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("euc-kr");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
int age=Integer.parseInt(request.getParameter("age"));
String gender=request.getParameter("gender");
String email=request.getParameter("email");
int status=0;
Connection conn=null; 

String driver="oracle.jdbc.driver.OracleDriver";  
String url="jdbc:oracle:thin:@localhost:1521:orcl";  
Class.forName(driver);  
conn=DriverManager.getConnection(url,"sms226","pass123");   
Statement stmt = conn.createStatement();  
 String SQL = "select count(*) cnt from member where id = '" + id + "'";
 // ������ �Է��� id �� DB �� �Ƶ� ������ ī��Ʈ�Ͽ� cnt �� ����
ResultSet rs = stmt.executeQuery(SQL);
rs.next() ;
if (rs != null) // �ҷ��� ������ �����ΰ�  �ְ�, �� �ߺ��� ���̵� �ִٸ�
   {
      if (rs.getInt("cnt") > 0)
      {   // null �� �ƴϰ� �Է��� ID�� member�� select�� ����� �ִٸ�
        out.println("�� ���̵�� �̹� �ٸ� ����� ����ϰ� ����.");
      }
      else  {  // �ߺ��� ID�� ������
    	  String  SQL1 = "insert into member(id, pass, name, age, gender, email, status) values (?,?,?,?,?,?,?)";
    	    PreparedStatement pstmt=conn.prepareStatement(SQL1); 
    	    pstmt.setString(1,id);
    	    pstmt.setString(2,pass);
    	    pstmt.setString(3,name);
    	    pstmt.setInt(4,age);
    	    pstmt.setString(5,gender);
    	    pstmt.setString(6,email);
    	    pstmt.setInt(7,status);
    	    pstmt.executeUpdate();            
    	    pstmt.close(); 
    	    stmt.close();  
    	    conn.close();      
    	    out.println("<script>");
    	    out.println("location.href='memberLogin.jsp'");
    	    out.println("</script>");
  	  }
   }
%>

   
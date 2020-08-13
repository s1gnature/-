<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.sql.*" %>  <!-- 추가 -->
 <%@ page import="javax.naming.*" %> <!-- 추가 -->
 <%@ page import="javax.sql.DataSource" %> <!-- 추가 -->

<%
 Connection conn=null;
 try {
 	Context ctx = new InitialContext(); 
    // DataSource 객체를 얻기 위해 객체 생성
	// InitialContext객체  ctx 생성(Context 를 상속 받음)
	DataSource dataFactory=(DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
 //  JNDI 서비스 구조의 초기 ROOT디렉토리 얻는 과정으로
//  lookup해서 각 WAS 서버의 서비스 루트 디렉토리를 얻는다 
// 톰캣의 루트 디렉토리는 "java:comp/env"  
// JNDI name은    dbc/Oracle11g
//  context.xml 에 등록한 jdbc/Oracle11g를 네이밍을 lookup (얻어온다)
// 톰캣의 context.xml 에 등록한 네이밍으로 DataSource 를 얻는다. 
 // Connection Pool 얻어오고, 반납하는 역할을 함. 
// Object 타입이므로 형변환을 함 (DataSource) 
 // 기존 DriverManager 방법은 static 한 필드를 사용하므로 Thread 환경에서는 부적절함
    conn = dataFactory.getConnection();
// 커넥션pool 에서 톰캣 서버가 생성해 놓은 Connection 으로 접속
 // dataFactory 즉 DataSource는 Context.xml 의  "javax.sql.DataSource“ 임 
 // dataFactory 객체로부터 Connection 객체를 얻어온다.
 // 지금 순간 부터는 이 객체는 웹 컨테이너의 DB 에 접속됨.
 	out.println("<h3>  DBCP Connection pool success . </h3>");
 } catch(Exception e) {
 	out.println("<h3>  DBCP Connection pool fail . </h3>");
 	e.printStackTrace();
 }
 if(conn != null){ conn.close(); }
//커넥션 풀에 사용한 커넥션 객체 다시 반납 (여기서는 메모리 해제가 아님)
%>
           
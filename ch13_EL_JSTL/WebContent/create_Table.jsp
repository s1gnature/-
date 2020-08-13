<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "sms226", "pass123");
Statement stmt = con.createStatement();
/*
 // [1] 단계 DAO_member 테이블 삭제
String sql = "drop table emp";
 stmt.executeUpdate(sql);
*/

/*
// [2] 단계 테이블  생성
String sql = "create table emp (emp_id varchar2(10) primary key, ename varchar2(10), salary number(5), depart varchar2(10) )";
stmt.executeUpdate(sql);
out.print("emp  테이블 생성됨.");  
*/

/*
//[3] 단계 테이블에 데이터 입력 
String sql = "insert into emp(emp_id, ename,salary,depart) values('aaaa','가가가',10000,'인사')" ;
stmt.executeUpdate(sql);
out.print ("emp 테이블에 Insert  됨.");  
*/

/*
//[4] 단계 테이블 내용 불러오기
ResultSet rs=stmt.executeQuery("select * from emp");
while(rs.next()) {
out.print("<br>" + rs.getString("emp_id") +  " : " + rs.getString("ename") +  " : " + rs.getString("salary") +  " : " + rs.getString("depart")); } 
rs.close();  
*/

stmt.close();
con.close();

%>

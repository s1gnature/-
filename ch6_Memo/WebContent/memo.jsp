<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.Calendar" %>
<body>
<% 
if ((session.getAttribute("id")==null)) {
/* memberLogin.jsp 에서 저장한 세션 값 */
out.println("<script>");
out.println("location.href='memberLogin.jsp'");
out.println("</script>");
}
%>
<%
	// Connection with oracleDB server
     request.setCharacterEncoding("euc-kr");
    int i=0;
    Connection conn=null;
     PreparedStatement pstmt=null;
     ResultSet rs=null;
    String driver="oracle.jdbc.driver.OracleDriver"; 
    String url="jdbc:oracle:thin:@localhost:1521:orcl";
	try {
		Class.forName(driver);  
		conn=DriverManager.getConnection(url,"sms226","pass123");
		// 여러 SQL  사용하려면 이 이하부터 다시 추가 하여 사용하면 됨.

		pstmt=conn.prepareStatement("SELECT * FROM memo_Test where name!='admin' order by indate desc");
		// order by indate desc  최근 글이 맨 위로 표시함
		rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%
// Send Query to get id(writer)
Statement stmt = conn.createStatement();
String cntsql = "SELECT COUNT(*) FROM memo_Test";
ResultSet rs1 = stmt.executeQuery(cntsql);
int totalPost = 0;
String id = (String)session.getAttribute("id");
if( rs1.next() )
{ 
	totalPost = rs1.getInt(1);	
}    
%>

<form name="memoform" action=" memo_ok.jsp" method="post">
<table width="700px"border="1" align="center">
<tr><td align="center" colspan=5>한 줄 메모장</td>
<tr>
	<td width="60px">작성자</td>
	<td><input type="text" name="name" value=<%=id%> readonly></td>
	<td width="80px">비밀번호</td>
	<td><input type="text" name="pass" value="" >
	<td rowspan=2><input type="submit" value="저장하기" ></td>
</tr>
<tr>
	<td>내용</td>
	<td colspan=3><input type="text" name="title" value="" style="width:500px"></td>
</tr>
</table>
<br><br>
<table border="1" cellspacing="1" align="center">
<tr><td colspan=5 align="center"> 총 <%= totalPost %>개 글이 있습니다. </td>

<% 
// init Calendar
Calendar now = Calendar.getInstance();
// get current day
int c_day=now.get(Calendar.DATE);

// get value which name='admin' 
PreparedStatement pstmt_admin=conn.prepareStatement("SELECT * FROM memo_Test where name='admin' order by indate desc"); 
ResultSet rs_admin=pstmt_admin.executeQuery();
String cntAdminSql = "SELECT COUNT(*) FROM memo_Test where name='admin'";
ResultSet cntAdminRs = stmt.executeQuery(cntAdminSql);
int adminPostCnt = 0;
if(cntAdminRs.next()){
	adminPostCnt = cntAdminRs.getInt(1);
}
// get only 3 value
for(int cnt=0; cnt<adminPostCnt; cnt++){ 
	rs_admin.next();
	if(cnt==3){
		break;
	}
	// get write day by substring
	String write_day=rs_admin.getString("indate").substring(8,10) ; 
	int w_day = Integer.parseInt(write_day);

	%>
	
	 <tr><td width="40px"> <%= rs_admin.getString(1) %></td>
        <td width="100px"> 
        	<%= rs_admin.getString(2) %>
        	<% // if date not passed 2 days, add NEW badge
       		if(w_day+2 > c_day ){ %>
    		<img src="new.png" >
 			<%}%> 
        </td>
        <td width="300px"> <%= rs_admin.getString(3) %>  </td> 
<td width="90px"> <%=(rs_admin.getString("indate")).substring(0,10) %>  </td>           
<% if(id.equals("admin")){ %>
	<td width="40px">
		<a href="memo_Delete.jsp?num=<%=rs_admin.getString(1) %>">삭제</a>
	</td>
	<%}%>
</tr>    
<%}%>  

<%
// get value which name!='admin'
while ( rs.next() )  {
	String write_day=rs.getString("indate").substring(8,10) ; 
	int w_day = Integer.parseInt(write_day);
%>
 <tr><td width="40px"> <%= rs.getString(1) %></td>
        <td width="100px"> 
        	<%= rs.getString(2) %>
        	<% // if date not passed 2 days, add NEW badge
       		if(w_day+2 > c_day ){ %>
    		<img src="new.png" >
 			<%}%>  
        </td> 
        <td width="300px"> <%= rs.getString(3) %>  </td> 
<td width="90px"> <%=(rs.getString("indate")).substring(0,10) %>  </td>           
<% if(id.equals("admin")){ %>
	<td width="40px">
		<a href="memo_Delete.jsp?num=<%=rs.getString(1) %>">삭제</a>
	</td>
<%	} %>

</tr>      
<%  }   %>
</table></form>
</body>
	
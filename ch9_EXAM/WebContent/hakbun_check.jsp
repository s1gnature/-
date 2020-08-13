<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<%
String id = request.getParameter("hakbun");   
      // 폼에서 입력한 id 참조, 
     boolean fnd = false;  // id 여부 저장

      if (id == null) // id 가 없으면
         id = "";
     else  
     {
       String driver="oracle.jdbc.driver.OracleDriver";  
      String url="jdbc:oracle:thin:@localhost:1521:orcl";    
      Connection conn=null;
      Class.forName(driver);  
      conn=DriverManager.getConnection(url,"sms226","pass123");  
      ResultSet rs = null;
      Statement stmt= conn.createStatement();
      String strSQL= "SELECT S_NUM FROM SCORE WHERE S_NUM='" + id + "'";
        // 뒤에 id는 아디 체크 폼에서 입력한 아이디임.
       rs = stmt.executeQuery(strSQL);

        if (rs.next())  fnd = true;    // 아디 존재 여부 저장할 부울 변수 
        // select 된 결과 행이 있으면 fnd 는 true, 즉 존재하면
           stmt.close();
           conn.close();
       }
       %>

 <HTML><HEAD><TITLE>hakbun check</TITLE></HEAD>
<script language="JavaScript">
function id_search()  // id 유효성 검사 메소드 , id 하나만 체크 함
{
   if(document.form_hakbun_check.id.value=="") 
   {
     alert("학번을 입력해 주세요.");
     document.form_hakbun_check.id.focus();
   }
     else 
     {
      document.form_hakbun_check.submit();
     }
}
function id_ok(a)
{
  opener.document.Exam_Login.hakbun.value=a;       
  self.close();   
}
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<BODY><CENTER><BR>
<P align="center">학번 입력후 검색 버튼을 누르세요</P>
<FORM NAME = "form_hakbun_check" ACTION = "hakbun_check.jsp" METHOD = "POST" >
  <TABLE WIDTH="250">
    <TR>     <TD WIDTH="150">학번</TD>
    <TD WIDTH="100"><INPUT TYPE="text"   NAME="hakbun"  size="20" 
               VALUE=<%= id %>></TD> 
           <!--  id_check.jsp  폼에서 입력하여 중복 검사 후 채워진 id -->
    <TD WIDTH="40" ><INPUT TYPE="button" VALUE="검색" 
                  onClick="javascript:id_search()"></TD>
    </TR>  </TABLE>
</FORM>
<% 
if (id != "" && fnd == false)  
  { 
   %>
 응시 가능한 학번입니다.<P>
  확인을 누르시면 로그인 화면으로 돌아갑니다.
   <a href ="javascript:id_ok('<%= id %>')">  확인 </a>
   <%      // 앞 4/6 의  id_ok() 가 보면
  }
else if (id != "" && fnd == true)
  { 
  %>
	<script>
	alert("이미 등록되어 있는 학번입니다. 확인해주세요.");
	</script>
	
  <%
  }
  %>
</CENTER></BODY></HTML>

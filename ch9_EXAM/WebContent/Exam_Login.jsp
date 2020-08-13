<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html><head></head>
<title>회원관리 시스템 로그인 페이지</title>
<script language=javascript>

function valid_check()
{
 //alert("사용자 함수를 호출함.");
	 if (document.Exam_Login.hakbun.value == "")
	    {
	         // joinform 은 form name="joinform" 임
	        // 다른 파일에서 같은 이름 사용하면 에러 발생-에러 고치기 어려움
	
	       alert("아이디를 입력하여 주시기 바랍니다.");
	       return false;
	    }
	
	if(document.Exam_Login.name.value == "")
	    {
	         // joinform 은 form name="joinform" 임
	        // 다른 파일에서 같은 이름 사용하면 에러 발생-에러 고치기 어려움
	       alert("이름 입력하여 주시기 바랍니다.");
	       document.Exam_Login.pass.focus();
	       return false;
	    }
	
	    document.Exam_Login.submit();  // 유효성 검사 통과면 action 페이지로 
	  
}
 function check_id() 
 {
   var JSPName = "hakbun_check.jsp";
   browsing_window = window.open(JSPName,      
   "_idcheck","height=220,width=420");
    browsing_window.focus(); 
   // 실행된 윈도우 창을 맨 앞으로 표시 
  }
</script>
<body>
<form name="Exam_Login" action="Exam_Start.jsp" method="post">
<center><table border=1>
<tr><td colspan="2" align=center>
     <b><font size=5>로그인 페이지</font></b></td></tr>
<tr><td>학번 : </td>
      <td><input type="text" name="hakbun"readonly/>
      <!-- 아디는 수정 못하게 일기 전용으로 --> 
  <input TYPE=button VALUE="ID Check" onclick="check_id()" onmouseover="this.style.cursor='hand';">
  <!--  onmouseover="this.style.cursor='hand' 마우스가 올라가면 손 모양으로 변환 -->
      
      </td></tr>
<tr><td>이름 :  </td>
           <td><input type="text" name="name"/></td></tr>
<tr><td colspan="2" align=center>
<!-- <a href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp; -->
     <INPUT TYPE = "button" VALUE = "문제 풀기" onclick="valid_check()">   &nbsp;&nbsp; 
     </td></tr></table><br><br>
     <tr><td><input type="button" onclick="location='Admin.jsp'" value="관리자 페이지"></tr></td>
     </center>
</form></body></html>

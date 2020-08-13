<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<title>회원관리 시스템 회원가입 페이지</title>
</head>
<script language=javascript>
function valid_check(){
	if(document.joinform.id.value == ""){
		alert("아이디를 입력하여 주시기 바랍니다.");
		document.joinform.id.focus();
		return false;
	}
	else if((document.joinform.id.value.length < 4) || (document.joinform.id.value.length >=9)){
		alert("아이디는 4자 이상 8자 이하 입니다.");
		document.joinform.id.focus();
		return false;
	}
	else if(document.joinform.pass.value == ""){
		alert("비밀번호를 입력하여 주시기 바랍니다.");
		document.joinform.pass.focus();
		return false;
	}
	else if(document.joinform.pass.value.length != 4){
		alert("비밀번호는 4자리 입니다.");
		document.joinform.pass.focus();
		return false;
	}
	else if(document.joinform.name.value == ""){
		alert("이름을 입력하여 주시기 바랍니다. ");
		document.joinform.name.focus();
		return false;
	}
	else if(document.joinform.age.value == ""){
		alert("나이를 입력하여 주시기 바랍니다.");
		document.joinform.age.focus();
		return false;
	}
	for(var i=0; i<document.joinform.age.value.lenght; i++){
		if((document.joinform.age.value.charAt(i) < "0") || (document.joinform.age.value.charAt(i) > "9")){
			alert("나이는 숫자만 가능합니다.");
			documnet.joinform.age.focus();
			return;
		}
	}
	document.joinform.submit();
	
}
function check_id() 
{
  var JSPName = "id_check.jsp";
  browsing_window = window.open(JSPName,      
  "_idcheck","height=220,width=420");
   browsing_window.focus(); 
  // 실행된 윈도우 창을 맨 앞으로 표시 
 }
</script>
<body>
<form name="joinform" action=" memberJoinOk.jsp" method="post">
 <!-- 반드시 폼 이름 은 파일명과 같게 한다. -->
<center>
<table border=1>
<tr><td colspan="2" align=center>
      <b><font size=5>회원가입 페이지</font></b> </td> </tr>
<tr><td>아이디 : </td>
      <td><input type="text" name="id" readonly/>
      <input type="button" value="ID Check" onclick="check_id()" onmouserover="this.style.cursor='hand';">
      </td></tr>
<tr><td>비밀번호 :  </td>
           <td><input type="password" name="pass"/></td></tr>
<tr><td>이름 : </td><td><input type="text" name="name"/></td></tr>
<tr><td>나이 : </td><td><input type="text" name="age" 
        maxlength=2 size=5/></td></tr>
<tr><td>성별 : </td>
      <td><input type="radio" name="gender" value="남" checked/>남자
      <input type="radio" name="gender" value="여"/>여자  </td></tr>
<tr><td>이메일 주소 : </td><td><input type="text" name="email" 
         size=30/></td></tr>
<tr><td colspan="2" align=center>
   <!--   <input type="submit" value="회원가입하기"> &nbsp;&nbsp;  -->
   <input type="button" value="회원가입" onclick="valid_check()">
     <a href="javascript:joinform.reset()">다시작성</a>
</td></tr>
</table></center></form>
</body></html>
           
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<title>ȸ������ �ý��� ȸ������ ������</title>
</head>
<script language=javascript>
function valid_check(){
	if(document.joinform.id.value == ""){
		alert("���̵� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
		document.joinform.id.focus();
		return false;
	}
	else if((document.joinform.id.value.length < 4) || (document.joinform.id.value.length >=9)){
		alert("���̵�� 4�� �̻� 8�� ���� �Դϴ�.");
		document.joinform.id.focus();
		return false;
	}
	else if(document.joinform.pass.value == ""){
		alert("��й�ȣ�� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
		document.joinform.pass.focus();
		return false;
	}
	else if(document.joinform.pass.value.length != 4){
		alert("��й�ȣ�� 4�ڸ� �Դϴ�.");
		document.joinform.pass.focus();
		return false;
	}
	else if(document.joinform.name.value == ""){
		alert("�̸��� �Է��Ͽ� �ֽñ� �ٶ��ϴ�. ");
		document.joinform.name.focus();
		return false;
	}
	else if(document.joinform.age.value == ""){
		alert("���̸� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
		document.joinform.age.focus();
		return false;
	}
	for(var i=0; i<document.joinform.age.value.lenght; i++){
		if((document.joinform.age.value.charAt(i) < "0") || (document.joinform.age.value.charAt(i) > "9")){
			alert("���̴� ���ڸ� �����մϴ�.");
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
  // ����� ������ â�� �� ������ ǥ�� 
 }
</script>
<body>
<form name="joinform" action=" memberJoinOk.jsp" method="post">
 <!-- �ݵ�� �� �̸� �� ���ϸ�� ���� �Ѵ�. -->
<center>
<table border=1>
<tr><td colspan="2" align=center>
      <b><font size=5>ȸ������ ������</font></b> </td> </tr>
<tr><td>���̵� : </td>
      <td><input type="text" name="id" readonly/>
      <input type="button" value="ID Check" onclick="check_id()" onmouserover="this.style.cursor='hand';">
      </td></tr>
<tr><td>��й�ȣ :  </td>
           <td><input type="password" name="pass"/></td></tr>
<tr><td>�̸� : </td><td><input type="text" name="name"/></td></tr>
<tr><td>���� : </td><td><input type="text" name="age" 
        maxlength=2 size=5/></td></tr>
<tr><td>���� : </td>
      <td><input type="radio" name="gender" value="��" checked/>����
      <input type="radio" name="gender" value="��"/>����  </td></tr>
<tr><td>�̸��� �ּ� : </td><td><input type="text" name="email" 
         size=30/></td></tr>
<tr><td colspan="2" align=center>
   <!--   <input type="submit" value="ȸ�������ϱ�"> &nbsp;&nbsp;  -->
   <input type="button" value="ȸ������" onclick="valid_check()">
     <a href="javascript:joinform.reset()">�ٽ��ۼ�</a>
</td></tr>
</table></center></form>
</body></html>
           
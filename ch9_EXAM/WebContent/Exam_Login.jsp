<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html><head></head>
<title>ȸ������ �ý��� �α��� ������</title>
<script language=javascript>

function valid_check()
{
 //alert("����� �Լ��� ȣ����.");
	 if (document.Exam_Login.hakbun.value == "")
	    {
	         // joinform �� form name="joinform" ��
	        // �ٸ� ���Ͽ��� ���� �̸� ����ϸ� ���� �߻�-���� ��ġ�� �����
	
	       alert("���̵� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
	       return false;
	    }
	
	if(document.Exam_Login.name.value == "")
	    {
	         // joinform �� form name="joinform" ��
	        // �ٸ� ���Ͽ��� ���� �̸� ����ϸ� ���� �߻�-���� ��ġ�� �����
	       alert("�̸� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
	       document.Exam_Login.pass.focus();
	       return false;
	    }
	
	    document.Exam_Login.submit();  // ��ȿ�� �˻� ����� action �������� 
	  
}
 function check_id() 
 {
   var JSPName = "hakbun_check.jsp";
   browsing_window = window.open(JSPName,      
   "_idcheck","height=220,width=420");
    browsing_window.focus(); 
   // ����� ������ â�� �� ������ ǥ�� 
  }
</script>
<body>
<form name="Exam_Login" action="Exam_Start.jsp" method="post">
<center><table border=1>
<tr><td colspan="2" align=center>
     <b><font size=5>�α��� ������</font></b></td></tr>
<tr><td>�й� : </td>
      <td><input type="text" name="hakbun"readonly/>
      <!-- �Ƶ�� ���� ���ϰ� �ϱ� �������� --> 
  <input TYPE=button VALUE="ID Check" onclick="check_id()" onmouseover="this.style.cursor='hand';">
  <!--  onmouseover="this.style.cursor='hand' ���콺�� �ö󰡸� �� ������� ��ȯ -->
      
      </td></tr>
<tr><td>�̸� :  </td>
           <td><input type="text" name="name"/></td></tr>
<tr><td colspan="2" align=center>
<!-- <a href="javascript:loginform.submit()">�α���</a>&nbsp;&nbsp; -->
     <INPUT TYPE = "button" VALUE = "���� Ǯ��" onclick="valid_check()">   &nbsp;&nbsp; 
     </td></tr></table><br><br>
     <tr><td><input type="button" onclick="location='Admin.jsp'" value="������ ������"></tr></td>
     </center>
</form></body></html>

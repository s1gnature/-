<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function pwCheck(){
	var textBox=document.getElementById("pw").value;
	var pw='admin*'
	if(textBox==pw){
   	    location.href='Admin_Welcome.jsp';
	}else{
   	    alert("��й�ȣ�� Ʋ��");
	}
}
</script>
</head>
<body>
<center>
<tr><td>������ ��й�ȣ : <input type="text" id="pw"></td></tr><br><br>
<tr><td><input type="button" onclick="pwCheck()" value="Ȯ��"></td></tr>
</center>
</body>
</html>
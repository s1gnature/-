<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("euc-kr");

String num=request.getParameter("num");
// �Ѱ��� �� �����͸� ���� ��  �Ʒ����� ���� ǥ���� ��
%>
<form action="memo_Delete_OK.jsp" method="post">
<table border=1>

<tr><td>�۹�ȣ</td><td><%=num%><input type="hidden" name="num" value="<%=num%>"> </td></tr>

<tr><td>��й�ȣ �Է�</td><td><input type="password" name="pass"></td></tr>

<tr><td align="center" colspan="2"><input type="submit" value="Ȯ��"></td></tr>

</table></form>

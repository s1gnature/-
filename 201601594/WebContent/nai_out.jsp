<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="NAI_Pack.ti_gyesan"%>
    <% request.setCharacterEncoding("euc-kr"); %>

<body>
<%
	String ageString = request.getParameter("age");
	int age = Integer.parseInt(ageString);
	ti_gyesan ti_year = new ti_gyesan();
	ti_year.setAge(age);
%>
<body>
�Է� �� ���̴� : <%=  ti_year.getAge()  %>  �̰�,  <br>
�¾ �⵵��  : <%=  ti_year.getBirth_year()  %>  �̰�,  <br>
�¾ �⵵ ���  : <%=  ti_year.getTi()  %>  �̴�,  <br>
�� �̸���  : <%=  ti_year.Test()  %>  �̴�.  <br>
</body>

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
입력 한 나이는 : <%=  ti_year.getAge()  %>  이고,  <br>
태어난 년도는  : <%=  ti_year.getBirth_year()  %>  이고,  <br>
태어난 년도 띠는  : <%=  ti_year.getTi()  %>  이다,  <br>
내 이름은  : <%=  ti_year.Test()  %>  이다.  <br>
</body>

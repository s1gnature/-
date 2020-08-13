<%@ page contentType="text/html; charset=utf-8" %>
 <%
        request.setAttribute("name", "EL Test");
 %>

 <body>
 request의 name 속성 : ${requestScope.name}; <br>
 <!--   EL로 표현할 경우 -->
 request의 name 속성 : <%= request.getAttribute("name") %> 
  <!--  jsp로 표현할 경우  -->
</body>

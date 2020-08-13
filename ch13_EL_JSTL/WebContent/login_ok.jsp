<%@ page language="java" contentType="text/html; 
    charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!-- 자바 빈 사용하기 위해 myBean 클래스(객체) 생성 -->
<!-- com.bean.LoginBean 파일 가 보고 올 것 --> 
<jsp:useBean id="myBean" class="com.bean.LoginBean" />

<!-- 이제부터는 myBean 으로 사용하겠다고 선언함. --> 
<!-- 자바빈의 속성 명과 html 태그 입력 파라미터 이름이 같으면  -->
<!-- property="*" 로 간단히 쓸 수 있다. -->  
<!-- 폼에서 입력받는 데이터를 한번에 set 하기 위해 
            property="*" 사용 -->
<jsp:setProperty name="myBean" property="*" />

<body>
<h4>EL  실습</h4>
<!-- name="myBean" property="*" 로 일괄 set 되어 있는 내용을 출력 -->
사용자 아이디: ${myBean.userid}<br>
사용자 비밀번호: ${myBean.passwd}<br>
</body>

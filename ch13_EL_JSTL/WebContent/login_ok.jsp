<%@ page language="java" contentType="text/html; 
    charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!-- �ڹ� �� ����ϱ� ���� myBean Ŭ����(��ü) ���� -->
<!-- com.bean.LoginBean ���� �� ���� �� �� --> 
<jsp:useBean id="myBean" class="com.bean.LoginBean" />

<!-- �������ʹ� myBean ���� ����ϰڴٰ� ������. --> 
<!-- �ڹٺ��� �Ӽ� ��� html �±� �Է� �Ķ���� �̸��� ������  -->
<!-- property="*" �� ������ �� �� �ִ�. -->  
<!-- ������ �Է¹޴� �����͸� �ѹ��� set �ϱ� ���� 
            property="*" ��� -->
<jsp:setProperty name="myBean" property="*" />

<body>
<h4>EL  �ǽ�</h4>
<!-- name="myBean" property="*" �� �ϰ� set �Ǿ� �ִ� ������ ��� -->
����� ���̵�: ${myBean.userid}<br>
����� ��й�ȣ: ${myBean.passwd}<br>
</body>

<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"  %> <!-- �����Լ� �߻����� Ŭ���� -->

<html>
<head>
<body>


<%!         // ���⸦ �����ϰ� �����ֱ� ���� �Լ�
String[] STRRandom(String e1, String e2, String e3, String e4) {
String[] result = new String[4];
Random random = new Random();
for (int i = 0; i < 4; i++)
	result[i] = "";  // �ʱ�ȭ
	int count = 0;

	while (true) {
		if (count == 4)  //  4ũ���� �迭�� ��� ���� ���� ��� �ݺ��� ����
		break;
		int k = random.nextInt(4);

		if (result[k].equals("")) {   //    k�� 0~3 ������ ���� �����ϰ� �޾� 
    		switch (count) {   // result[k]�� ��������� count ���� ���� ���� ����
           		case 0:
                  result[k] = e1;      count++;     break;
            	case 1:
                   result[k] = e2;     count++;    break;
            	case 2:
                   result[k] = e3;      count++;     break;
           		case 3:
                 result[k] = e4;        count++;    break;
        	}
    	}     
	}
    return result;
}
%>
<%
 String munje="���� ��  ���� ° ũ���� ���ڴ� ?";
String bg1 = "��";     String bg2 = "��";
String bg3 = "��";     String bg4 = "��";
String[] show = STRRandom(bg1, bg2, bg3, bg4);  // �޼ҵ� ȣ��
 %>
</CENTER>
	<B>���� 1&nbsp;   <%= munje %>  <br>    <!--  �����ϰ� ���� ���� ��� -->
	<INPUT TYPE="RADIO" NAME="bogi1" value="<%=show[0]%>"><%= show[0] %> &nbsp;&nbsp;
	<INPUT TYPE="RADIO" NAME="bogi1" value="<%=show[1]%>"><%= show[1] %> &nbsp;&nbsp;
	<INPUT TYPE="RADIO" NAME="bogi1" value="<%=show[2]%>"><%= show[2] %> &nbsp;&nbsp;
	<INPUT TYPE="RADIO" NAME="bogi1" value="<%=show[3]%>"><%= show[3] %> &nbsp;&nbsp;
</CENTER>
</body>
</head>
</html>

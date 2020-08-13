<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*"  %> <!-- �����Լ� �߻����� Ŭ���� -->
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
    request.setCharacterEncoding("euc-kr");

     String id=null;
     Connection conn=null;
     PreparedStatement pstmt=null;
     ResultSet rs=null;

    String driver="oracle.jdbc.driver.OracleDriver";  
    String url="jdbc:oracle:thin:@localhost:1521:orcl";

 // �α��� ���� �ʾҰų�(���ǰ��� ������)  �Ǵ� �����ڰ� �ƴϸ� 
    // memberLogin.jsp �� ����.  
    // �ٷ� memberList.jsp�� �����ϸ� memberLogin.jsp �� ƨ�ܳ���

            // ���������� �α��� �ϰ� ������ �̰� ����
    		try {
    		Class.forName(driver);  
    		conn=DriverManager.getConnection(url,"sms226","pass123");
    		pstmt=conn.prepareStatement("SELECT * FROM sihyeomMunje");
    		rs=pstmt.executeQuery();
    		}catch(Exception e){
    		e.printStackTrace();
    		}
    		
  
%>
<!DOCTYPE html>
<html>
<body>
<form name="sampleExam2Ok" action=" sampleExam2Ok.jsp" method="post">
<head>
<meta charset="EUC-KR">
<table border=0 width=500>
	<%
	int cnt = 1;
	while(rs.next()) { 
		String bg1 = rs.getString("bogi1");
		String bg2 = rs.getString("bogi2");
		String bg3 = rs.getString("bogi3");
		String bg4 = rs.getString("bogi4");
		String[] show = STRRandom(bg1, bg2, bg3, bg4);  // �޼ҵ� ȣ��
		String answer = "answer"+Integer.toString(cnt);%>
	<tr><td width=100 style="font-weight:bold">���� <%= cnt %></td><td colspan=4><%=rs.getString("munje")%></td></tr>
	<tr><td></td>
	<td><input type="radio" name="<%=answer %>" value="<%=show[0]%>"/><%=show[0]%></td>
	<td><input type="radio" name="<%=answer %>" value="<%=show[1]%>"/><%=show[1]%></td>
	<td><input type="radio" name="<%=answer %>" value="<%=show[2]%>"/><%=show[2]%></td>
	<td><input type="radio" name="<%=answer %>" value="<%=show[3]%>"/><%=show[3]%></td>
	</tr>
	<%cnt++;} %>
	<tr><td colspan=5></td><td><input type="submit" value="ü�� �� �����ϱ�"></td></tr>
	<input type="hidden" name="cnt" value="<%=cnt-1%>">
</table>
</head>
</form>
</body>
</html>
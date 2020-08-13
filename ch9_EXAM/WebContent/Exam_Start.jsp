<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*"  %> <!-- 랜덤함수 발생관련 클래스 -->
<%!         // 보기를 랜덤하게 보여주기 위한 함수
String[] STRRandom(String e1, String e2, String e3, String e4) {
String[] result = new String[4];
Random random = new Random();
for (int i = 0; i < 4; i++)
	result[i] = "";  // 초기화
	int count = 0;

	while (true) {
		if (count == 4)  //  4크기의 배열에 모두 값이 들어갔을 경우 반복문 종료
		break;
		int k = random.nextInt(4);

		if (result[k].equals("")) {   //    k에 0~3 사이의 값을 랜덤하게 받아 
    		switch (count) {   // result[k]가 비어있으면 count 값에 따라 값을 넣음
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
<%! 
String Check(String s, String c){
	if (c.equals("TT")){
		if(s==null) return "";
		else return s;
	}else{
		return "<img src=\"image\\" + s + "\" style=\"max-width :70; height: auto;\"/>";
	}
}
%>
<%
    request.setCharacterEncoding("euc-kr");
	String hakbun=request.getParameter("hakbun");
	String name=request.getParameter("name");
     Connection conn=null;
     PreparedStatement pstmt=null;
     ResultSet rs=null;

    String driver="oracle.jdbc.driver.OracleDriver";  
    String url="jdbc:oracle:thin:@localhost:1521:orcl";

 // 로그인 하지 않았거나(세션값이 없으면)  또는 관리자가 아니면 
    // memberLogin.jsp 로 가라.  
    // 바로 memberList.jsp를 실행하면 memberLogin.jsp 로 튕겨나감

            // 정상적으로 로그인 하고 들어오면 이곳 수행
    		try {
    		Class.forName(driver);  
    		conn=DriverManager.getConnection(url,"sms226","pass123");
    		pstmt=conn.prepareStatement("SELECT * FROM ( SELECT * FROM QUIZ ORDER BY DBMS_RANDOM.RANDOM) where rownum<= 5 ");
    		rs=pstmt.executeQuery();
    		}catch(Exception e){
    		e.printStackTrace();
    		}
    		
  
%>
<%
/*
      // 폼에서 입력한 id 참조, 
     boolean fnd = false;  // hakbun 여부 저장
     if (hakbun == null) // hakbun 가 없으면
         hakbun = "";
     else  
     {
       String H_driver="oracle.jdbc.driver.OracleDriver";  
      String H_url="jdbc:oracle:thin:@localhost:1521:orcl";
      Connection H_conn=null;
Class.forName(driver);  
conn=DriverManager.getConnection(url,"sms226","pass123");  
ResultSet H_rs = null;
Statement stmt= conn.createStatement();
String strSQL= "SELECT S_NUM FROM SCORE WHERE S_NUM=" + hakbun;
  // 뒤에 id는 아디 체크 폼에서 입력한 아이디임.
 H_rs = stmt.executeQuery(strSQL);

  if (H_rs.next()) fnd = true;  // 학번 존재 여부 저장할 부울 변수
  // select 된 결과 행이 있으면 fnd 는 true, 즉 존재하면
     stmt.close();
     conn.close();
  }
*/
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name="Exam_start" action="Exam_Result.jsp" method="post">
<center>
<tr>제한시간 : <span style="font-weight:bold" id="timerTxt"></span> 초   <input type="button" value="메인으로 돌아가기" onclick="location='Exam_Login.jsp'"></tr><br><br>
<script type="text/javascript">
		var timerId;
		var timerSec = 60;
		document.getElementById("timerTxt").innerHTML = "60"
		window.onload= function() {
			timerId = setInterval('timer()', 1000);
		}

		function timer() {
			var sec = timerSec
			var msg = (sec < 10 ? "0"+ sec : sec);
			timerSec--;
			if (timerSec < 0) { /* time End*/
				clearInterval(timerId);
				alert("주어진 시간을 다 사용하여 자동으로 제출합니다.");
				document.Exam_start.submit();
			}
			document.getElementById("timerTxt").innerHTML = msg;
		}

	</script>
	</center>
	<center>
		<tr><td>학번 : </td><td><input type="text" name="s_num" value="<%=hakbun%>"readonly></td><td>이름 : </td><td><input type="text" name="s_name" value="<%=name%>" readonly></td></tr><br><br>
	</center>
	<table border=0 width=900>
	<%
	int cnt = 1;
	request.setAttribute("q_rs", rs);
	while(rs.next()) { 
		String bg1 = rs.getString("Q_EX1");
		String bg2 = rs.getString("Q_EX2");
		String bg3 = rs.getString("Q_EX3");
		String bg4 = rs.getString("Q_EX4");
		String q_answer = rs.getString("Q_ANSWER");
		String Q_IMAGE = rs.getString("Q_IMAGE");
		String TYPE_Q = rs.getString("Q_TYPE");
		String[] show = STRRandom(bg1, bg2, bg3, bg4);  // 메소드 호출
		String answer = "answer"+Integer.toString(cnt);
		String q_answer_name = "Q_ANSWER"+Integer.toString(cnt);%>
		<tr><td colspan=6><hr></tr>
	<tr><td width="8%" style="font-weight:bold">문제 <%= cnt %></td><td colspan=4 width="92%"><%=rs.getString("Q_QUESTION")%></td></tr>
	<tr><td></td>
	<td><input type="radio" name="<%=answer %>" value="<%=show[0]%>"/><%=Check(show[0], TYPE_Q) %></td>
	<td><input type="radio" name="<%=answer %>" value="<%=show[1]%>"/><%=Check(show[1], TYPE_Q)%></td>
	<td><input type="radio" name="<%=answer %>" value="<%=show[2]%>"/><%=Check(show[2], TYPE_Q)%></td>
	<td><input type="radio" name="<%=answer %>" value="<%=show[3]%>"/><%=Check(show[3], TYPE_Q)%></td>
	<td><input type="hidden" name="<%=q_answer_name %>" value="<%=q_answer%>"></td>
	</tr>
	<%cnt++;} %>
	<tr><td colspan=6><hr></tr>
	<tr><td colspan=6 align=center>체크 하지 않은 문제는 틀린 것으로 채점 됩니다.</td></tr>
	<tr><td colspan=6 align=center><input type="submit" value="체점 후 제출하기"></td></tr>
	<input type="hidden" name="cnt" value="<%=cnt%>">
</table>
	</form>
</body>
</html>
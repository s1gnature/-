package ch10_package;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class memberServlet
 */
@WebServlet("/memberServlet")
public class memberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=euc-kr");
	     //  응답할 문서 타입과 인코딩 방식을 지정
	     request.setCharacterEncoding("EUC-KR"); // post 한글처리
	     // 교재 있는 소스와 다름
	     String username = request.getParameter("username");
	     String address = request.getParameter("address");
	     String userid = request.getParameter("userid");
	     String passwd = request.getParameter("passwd");
	     String email = request.getParameter("email");
	     // writer  브라우저에 출력하기 위한 스트림 객체 
	        // 응답 문서에 출력하기 위한 PrintWriter 객체  writer를 생성 
	      PrintWriter writer = response.getWriter();    /* import 할 것 */
	      writer.println("<br><html><head></head><body>");
	      writer.println(" 이름 : " + username + "<br />");
	      writer.println("주소 : " + address + "<br />");
	      writer.println("아이디 : " + userid + "<br />" );
	      writer.println("비밀번호 : " + passwd + "<br />");
	      writer.println("이메일 : " + email);
	      writer.println("</body></html>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

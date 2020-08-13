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
	     //  ������ ���� Ÿ�԰� ���ڵ� ����� ����
	     request.setCharacterEncoding("EUC-KR"); // post �ѱ�ó��
	     // ���� �ִ� �ҽ��� �ٸ�
	     String username = request.getParameter("username");
	     String address = request.getParameter("address");
	     String userid = request.getParameter("userid");
	     String passwd = request.getParameter("passwd");
	     String email = request.getParameter("email");
	     // writer  �������� ����ϱ� ���� ��Ʈ�� ��ü 
	        // ���� ������ ����ϱ� ���� PrintWriter ��ü  writer�� ���� 
	      PrintWriter writer = response.getWriter();    /* import �� �� */
	      writer.println("<br><html><head></head><body>");
	      writer.println(" �̸� : " + username + "<br />");
	      writer.println("�ּ� : " + address + "<br />");
	      writer.println("���̵� : " + userid + "<br />" );
	      writer.println("��й�ȣ : " + passwd + "<br />");
	      writer.println("�̸��� : " + email);
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

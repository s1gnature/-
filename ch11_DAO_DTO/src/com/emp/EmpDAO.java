package com.emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;   //�߰� 
import javax.naming.Context;   //  �߰�
import javax.naming.InitialContext;  //  �߰�
import javax.naming.NamingException;  //  �߰�
import javax.sql.DataSource;     //  �߰�
// DBCP
import javax.naming.Context;   //  �߰�
import javax.naming.InitialContext;  //  �߰�
import javax.naming.NamingException;  //  �߰�
import javax.sql.DataSource;     //  �߰�

public class EmpDAO {
	/* JDBC
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl"; 
	String userid = "sms226";                 //  ���ΰ����� ����
	String passwd = "pass123";               // ���ΰ����� ����

	public EmpDAO(){    // ������
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  //  end catch
	} //end ������ EmpDAO
	*/
	
	// DBCP
	DataSource dataFactory; // DataSource  ��ü ����  
	public EmpDAO(){  // default ������
		try {
			Context ctx = new InitialContext();  
			// [1] InitialContext��ü ����(Context �� ��� ����)
			dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
			// [2] JNDI ���� ������ �ʱ� ROOT���丮 ���
			// context.xml �� ����� ���̹��� lookup�ؼ� 
			// ��Ĺ�� ��Ʈ ���丮 "java:comp/env�� �� //��´�
			//  ��Ĺ�� context.xml �� ����� ������  DataSource �� ��´�.
		} catch (NamingException e) { 
			e.printStackTrace();
		}
	}//end EmpDAO

	// ==================== Start Select()===========================
	public ArrayList<EmpDTO> select(){   // �޼ҵ� ����
		//  ������ ������ EmpDTO �̰�,  �� �����Ͱ� ����� ��������  
		// ArrayList �̰�  ������ ��ü�� list ��
		ArrayList<EmpDTO> list = new  ArrayList<EmpDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			//JDBC
			//con = DriverManager.getConnection(url, userid, passwd);
			//DBCP
			con = dataFactory.getConnection();
			// Context.xml �� web.xml ���� ������ ������ �����Ͽ� 
			// Connection ��ü�� ������.

			String sql = "select emp_id, ename, salary, depart from emp";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String emp_id = rs.getString("emp_id");
				String ename = rs.getString("ename");
				int salary = rs.getInt("salary");
				String depart = rs.getString("depart");
		  
				EmpDTO dto = new EmpDTO(emp_id, ename, salary, depart);
				list.add(dto);
				//  EmpDTO ������  11 ����  �Ű����� �ִ� ������
				// �ѻ���� �����͸� dto �� �����ϰ�, ��� �����ؾ� �ϴϱ� 
				// ArrayList ������ list �� �ݺ��Ͽ� ���� ��.
				// ������ list ������ 70 ���� return list ���� 
				// SelectDAOservlet.java ��  40 ����
				// ArrayList<EmpDTO> list = dao.select();   ���� ��������
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;  // SelectDAOservlet.java ��  40 �������� ��������
	} //end select

	public boolean registerEmp(EmpDTO dto)  {  // �������� �οﰪ
		PreparedStatement pstmt = null;
		Connection conn=null;
		try {
			//JDBC
			//conn = DriverManager.getConnection(url, userid, passwd);
			
			//DBCP
			conn = dataFactory.getConnection();  // �߰�
			//  Context.xml �� web.xml ���� ������ ������ �����Ͽ� 
			//  Connection ��ü�� ������.
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String query = "insert into Emp values (?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getEmp_id());
			pstmt.setString(2, dto.getEname());
			pstmt.setInt(3, dto.getSalary());
			pstmt.setString(4, dto.getDepart());
			pstmt.executeUpdate();  
			pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
	}
 //    =======   end  registerEmp()   ==============
} //


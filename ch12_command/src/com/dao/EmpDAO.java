package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;    // 
import javax.naming.Context;    //
import javax.naming.InitialContext;    //
import javax.naming.NamingException;   //
import javax.sql.DataSource;      //
import com.domain.EmpDTO;  //  ��Ű���� �ٸ� Ŭ������ import �Ͽ� ���

public class EmpDAO {
	DataSource dataFactory;  // DataSource ��ü ����

	public EmpDAO(){   // ������ _ �� ������ ����Ŭ ����̹� �ε�
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	} //end EmpDAO ������ - DB�� �����ϱ� ���� Connection ��ü��
	// EmpDAO() ȣ��(������)�ϴ� ���� �ٷ� �ε��.
	
	// ��ȯ���� ArrayList�̰�, ������ Ÿ���� EmpDTO ��
	// select() �޼ҵ� ����.  EmpDTO  ���� �ҽ� ���� �� ��
	public ArrayList<EmpDTO> select(){
		// ��ȯ���� ArrayList�̰�, ������ Ÿ���� EmpDTO ��
		// EmpDTO ������ ��ü list ����
		ArrayList<EmpDTO> list = new  ArrayList<EmpDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = dataFactory.getConnection(); // Connection ��ü ȣ��
			String sql = "select emp_id, ename, salary, depart from emp";
			pstmt = con.prepareStatement(sql);
			// con ��ü�κ��� pstmt ��ü ���� �� ������ ������.
			rs = pstmt.executeQuery();  // ���� ��
			while(rs.next()){
				// ��ü ������ �����ͼ� �ϳ��� ���ʴ�� ó���ϴ� ����
				String emp_id = rs.getString("emp_id");
				String ename = rs.getString("ename");
				int salary = rs.getInt("salary");
				String depart = rs.getString("depart");
				EmpDTO dto = new EmpDTO(emp_id, ename, salary, depart);
				// �����ڵ� ���� dto��ü�� ��ȯ �� ���� ���� ArrayList ��ü dtos �� �߰�
				list.add(dto); // �ϳ��� ����  dto �� �־��ٰ� list �� �߰���
				// ���̻� �����Ͱ� ���� ������ ��� �����͸� list �� �߰���
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
		return list;   // �������� ����Ʈ�� ����� �������� ���� ȣ���� ������  ����
	}  // end select
	
	public boolean insert(EmpDTO dto){
		// ��ȯ���� ArrayList�̰�, ������ Ÿ���� EmpDTO ��
		// EmpDTO ������ ��ü list ����
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = dataFactory.getConnection(); // Connection ��ü ȣ��
		}catch(Exception e){
			e.printStackTrace();
		}
		String sql = "insert into emp values (?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getEmp_id());
			pstmt.setString(2, dto.getEname());
			pstmt.setInt(3, dto.getSalary());
			pstmt.setString(4, dto.getDepart());
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {    
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		}
		return true;
	}
}  // end class



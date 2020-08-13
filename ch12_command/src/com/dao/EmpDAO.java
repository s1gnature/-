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
import com.domain.EmpDTO;  //  패키지가 다른 클래스는 import 하여 사용

public class EmpDAO {
	DataSource dataFactory;  // DataSource 객체 선언

	public EmpDAO(){   // 생성자 _ 이 순간에 오라클 드라이버 로드
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	} //end EmpDAO 생성자 - DB에 접근하기 위한 Connection 객체로
	// EmpDAO() 호출(생성자)하는 순간 바로 로드됨.
	
	// 반환형은 ArrayList이고, 데이터 타입은 EmpDTO 인
	// select() 메소드 선언.  EmpDTO  가서 소스 보고 올 것
	public ArrayList<EmpDTO> select(){
		// 반환형은 ArrayList이고, 데이터 타입은 EmpDTO 인
		// EmpDTO 데이터 객체 list 선언
		ArrayList<EmpDTO> list = new  ArrayList<EmpDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = dataFactory.getConnection(); // Connection 객체 호출
			String sql = "select emp_id, ename, salary, depart from emp";
			pstmt = con.prepareStatement(sql);
			// con 객체로부터 pstmt 객체 생성 후 데이터 가져옴.
			rs = pstmt.executeQuery();  // 실행 후
			while(rs.next()){
				// 전체 데이터 가져와서 하나씩 차례대로 처리하는 과정
				String emp_id = rs.getString("emp_id");
				String ename = rs.getString("ename");
				int salary = rs.getInt("salary");
				String depart = rs.getString("depart");
				EmpDTO dto = new EmpDTO(emp_id, ename, salary, depart);
				// 각레코드 값을 dto객체로 변환 후 내가 만든 ArrayList 객체 dtos 에 추가
				list.add(dto); // 하나의 값을  dto 에 넣었다가 list 에 추가함
				// 더이상 데이터가 없을 때까지 모든 데이터를 list 에 추가함
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
		return list;   // 마지막에 리스트에 저장된 여러개의 값을 호출한 곳으로  리턴
	}  // end select
	
	public boolean insert(EmpDTO dto){
		// 반환형은 ArrayList이고, 데이터 타입은 EmpDTO 인
		// EmpDTO 데이터 객체 list 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = dataFactory.getConnection(); // Connection 객체 호출
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



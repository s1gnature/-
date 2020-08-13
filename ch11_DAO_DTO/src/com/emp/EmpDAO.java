package com.emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;   //추가 
import javax.naming.Context;   //  추가
import javax.naming.InitialContext;  //  추가
import javax.naming.NamingException;  //  추가
import javax.sql.DataSource;     //  추가
// DBCP
import javax.naming.Context;   //  추가
import javax.naming.InitialContext;  //  추가
import javax.naming.NamingException;  //  추가
import javax.sql.DataSource;     //  추가

public class EmpDAO {
	/* JDBC
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl"; 
	String userid = "sms226";                 //  본인것으로 수정
	String passwd = "pass123";               // 본인것으로 수정

	public EmpDAO(){    // 생성자
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  //  end catch
	} //end 생성자 EmpDAO
	*/
	
	// DBCP
	DataSource dataFactory; // DataSource  객체 선언  
	public EmpDAO(){  // default 생성자
		try {
			Context ctx = new InitialContext();  
			// [1] InitialContext객체 생성(Context 를 상속 받음)
			dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
			// [2] JNDI 서비스 구조의 초기 ROOT디렉토리 얻기
			// context.xml 에 등록한 네이밍을 lookup해서 
			// 톰캣의 루트 디렉토리 "java:comp/env“ 를 //얻는다
			//  톰캣의 context.xml 에 등록한 정보로  DataSource 를 얻는다.
		} catch (NamingException e) { 
			e.printStackTrace();
		}
	}//end EmpDAO

	// ==================== Start Select()===========================
	public ArrayList<EmpDTO> select(){   // 메소드 선언
		//  데이터 형식은 EmpDTO 이고,  이 데이터가 저장될 변수명은  
		// ArrayList 이고  생성된 객체는 list 임
		ArrayList<EmpDTO> list = new  ArrayList<EmpDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			//JDBC
			//con = DriverManager.getConnection(url, userid, passwd);
			//DBCP
			con = dataFactory.getConnection();
			// Context.xml 및 web.xml 에서 설정한 내용을 참조하여 
			// Connection 객체를 생성함.

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
				//  EmpDTO 가보면  11 라인  매개변수 있는 생성자
				// 한사람의 데이터를 dto 에 저장하고, 계속 누적해야 하니까 
				// ArrayList 형태인 list 에 반복하여 누적 함.
				// 누적된 list 내용을 70 라인 return list 에서 
				// SelectDAOservlet.java 의  40 라인
				// ArrayList<EmpDTO> list = dao.select();   으로 리턴해줌
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
		return list;  // SelectDAOservlet.java 의  40 라인으로 리턴해줌
	} //end select

	public boolean registerEmp(EmpDTO dto)  {  // 리턴형이 부울값
		PreparedStatement pstmt = null;
		Connection conn=null;
		try {
			//JDBC
			//conn = DriverManager.getConnection(url, userid, passwd);
			
			//DBCP
			conn = dataFactory.getConnection();  // 추가
			//  Context.xml 및 web.xml 에서 설정한 내용을 참조하여 
			//  Connection 객체를 생성함.
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


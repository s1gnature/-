package com.service;

import java.util.ArrayList;   // 추가
import javax.servlet.http.HttpServletRequest;  // 추가
import javax.servlet.http.HttpServletResponse;  // 추가
import com.dao.EmpDAO;  // 추가
import com.domain.EmpDTO;  // 추가

public class InsertService {
	public boolean execute(EmpDTO dto){
		EmpDAO dao = new EmpDAO(); // EmpDAO() 의 dao 객체 생성. 
		return dao.insert(dto);     
		// dao객체의 select() 메소드 실행하여 값을 frontControllerServlet 
		// 로 리턴.  dao 의 select()즉 EmpDAO 의 select() 가 보면
		// SelectService 를 사용하는 이유 : 전체적인 형식을 통일하기 위해 사용
		// 나머지는 상속받아 구현하게 함-인터페이스
	}  //  end SelectService
}

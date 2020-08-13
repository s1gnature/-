package com.service;

import java.util.ArrayList;   // �߰�
import javax.servlet.http.HttpServletRequest;  // �߰�
import javax.servlet.http.HttpServletResponse;  // �߰�
import com.dao.EmpDAO;  // �߰�
import com.domain.EmpDTO;  // �߰�

public class InsertService {
	public boolean execute(EmpDTO dto){
		EmpDAO dao = new EmpDAO(); // EmpDAO() �� dao ��ü ����. 
		return dao.insert(dto);     
		// dao��ü�� select() �޼ҵ� �����Ͽ� ���� frontControllerServlet 
		// �� ����.  dao �� select()�� EmpDAO �� select() �� ����
		// SelectService �� ����ϴ� ���� : ��ü���� ������ �����ϱ� ���� ���
		// �������� ��ӹ޾� �����ϰ� ��-�������̽�
	}  //  end SelectService
}

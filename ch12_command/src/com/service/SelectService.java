package com.service;

import java.util.ArrayList;   // �߰�
import javax.servlet.http.HttpServletRequest;  // �߰�
import javax.servlet.http.HttpServletResponse;  // �߰�
import com.dao.EmpDAO;  // �߰�
import com.domain.EmpDTO;  // �߰�

// �����Ͻ� ������ ó���ϴ� ���� Ŭ������ ����- 
//  �Ϲ������� �������̽��� ����Ͽ� ���������� ���⼭�� ������.
public class SelectService {
	public ArrayList<EmpDTO> execute(){
		EmpDAO dao = new EmpDAO(); // EmpDAO() �� dao ��ü ����. 
	return dao.select();     
	// dao��ü�� select() �޼ҵ� �����Ͽ� ���� frontControllerServlet 
	// �� ����.  dao �� select()�� EmpDAO �� select() �� ����
	// SelectService �� ����ϴ� ���� : ��ü���� ������ �����ϱ� ���� ���
	// �������� ��ӹ޾� �����ϰ� ��-�������̽�
	}  //  end SelectService
}  //  ene class

package com.bean;

public class LoginBean {
	private String userid;
	private String passwd;
	
	// �ڹ� ���̶� ?
		// private �� ��� ������ ������ �Ϲ������� �Ӽ�(property)�̶� ��.
		//getter �޼ҵ�� setter �޼ҵ带 ������.
		// ���� ���� �����ڰ� �ݵ�� �����ؾ� �Ѵ�.
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
}

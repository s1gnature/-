package com.bean;

public class LoginBean {
	private String userid;
	private String passwd;
	
	// 자바 빈이란 ?
		// private 한 멤버 변수를 가지며 일반적으로 속성(property)이라 함.
		//getter 메소드와 setter 메소드를 가진다.
		// 인자 없는 생성자가 반드시 존재해야 한다.
	
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

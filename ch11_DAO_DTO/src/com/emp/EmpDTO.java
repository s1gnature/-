package com.emp;

public class EmpDTO {
	private String emp_id;
	String ename;
	int salary;
	String depart;

	public EmpDTO() {}  // default 생성자

	public EmpDTO(String emp_id, String ename, int salary, String depart) {
		this.emp_id = emp_id;
		this.ename = ename;
		this.salary = salary;
		this.depart = depart;
	}    /* 인스턴스 변수를 초기화 할 매개변수 있는 생성자*/
	
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
}

package com.daou.pd.admin.employee;

public class EmpVO {

	// 사원테이블
	private String e_id;
	private String e_name;
	private int e_dep;
	private String e_pw;
	private String e_tel;
	private int e_type;
	private String[] checkDel;

	public int getE_dep() {
		return e_dep;
	}

	public void setE_dep(int e_dep) {
		this.e_dep = e_dep;
	}

	public String[] getCheckDel() {
		return checkDel;
	}

	public void setCheckDel(String[] checkDel) {
		this.checkDel = checkDel;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_pw() {
		return e_pw;
	}

	public void setE_pw(String e_pw) {
		this.e_pw = e_pw;
	}

	public String getE_tel() {
		return e_tel;
	}

	public void setE_tel(String e_tel) {
		this.e_tel = e_tel;
	}

	public int getE_type() {
		return e_type;
	}

	public void setE_type(int e_type) {
		this.e_type = e_type;
	}

}

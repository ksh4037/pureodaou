package com.daou.pd.user.mod;

public class UserVO {

	// ������̺�
	private String e_id;
	private String e_name;
	private int e_dep;
	private String e_pw;
	private String e_tel;
	private int e_type;

	// �μ� ���̺�

	private int dept_no;
	private String dept_name;
	private String reg_id;
	private String reg_date;
	private String updt_id;
	private String updt_date;
	private String delete_yn;

	public int getE_dep() {
		return e_dep;
	}

	public void setE_dep(int e_dep) {
		this.e_dep = e_dep;
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

	public int getDept_no() {
		return dept_no;
	}

	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUpdt_id() {
		return updt_id;
	}

	public void setUpdt_id(String updt_id) {
		this.updt_id = updt_id;
	}

	public String getUpdt_date() {
		return updt_date;
	}

	public void setUpdt_date(String updt_date) {
		this.updt_date = updt_date;
	}

	public String getDelete_yn() {
		return delete_yn;
	}

	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}
}

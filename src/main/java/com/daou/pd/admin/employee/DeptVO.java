package com.daou.pd.admin.employee;

public class DeptVO {
	private int dept_no;
	private String dept_name;
	private String reg_id;
	private String reg_date;
	private String updt_id;
	private String updt_date;
	private String delete_yn;

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

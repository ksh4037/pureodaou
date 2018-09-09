package com.daou.pd.admin.board;

public class BoardVO {

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	private int b_no;
	private String b_title;
	private String b_content;
	private String b_reg_id;
	private String b_reg_date;
	private int b_view_cnt;
	private String b_upt_id;
	private String b_upt_date;
	private String b_delete_yn;
	private String e_name;

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_reg_date() {
		return b_reg_date;
	}

	public void setB_reg_date(String b_reg_date) {
		this.b_reg_date = b_reg_date;
	}

	public String getB_upt_date() {
		return b_upt_date;
	}

	public void setB_upt_date(String b_upt_date) {
		this.b_upt_date = b_upt_date;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_reg_id() {
		return b_reg_id;
	}

	public void setB_reg_id(String b_reg_id) {
		this.b_reg_id = b_reg_id;
	}

	public int getB_view_cnt() {
		return b_view_cnt;
	}

	public void setB_view_cnt(int b_view_cnt) {
		this.b_view_cnt = b_view_cnt;
	}

	public String getB_upt_id() {
		return b_upt_id;
	}

	public void setB_upt_id(String b_upt_id) {
		this.b_upt_id = b_upt_id;
	}

	public String getB_delete_yn() {
		return b_delete_yn;
	}

	public void setB_delete_yn(String b_delete_yn) {
		this.b_delete_yn = b_delete_yn;
	}

}

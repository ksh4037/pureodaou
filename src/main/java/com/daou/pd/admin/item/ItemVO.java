package com.daou.pd.admin.item;

import java.util.List;

public class ItemVO {

	private int item_no;
	private int item_title;
	private String item_contents;
	private String item_type;
	private String reg_id;
	private String reg_date;
	private String upt_id;
	private String upt_date;
	private String use_yn;

	
	private List<OptionVO> ovo;


	// 몇 번째가 정답인지 받아오는 변수
	private int answer_no;

	// 카테고리
	private int category_no;
	private String category_name;

	// 검색
	private String scType;
	private String srch_input;


	
	
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

	public String getUpt_id() {
		return upt_id;
	}

	public void setUpt_id(String upt_id) {
		this.upt_id = upt_id;
	}

	public String getUpt_date() {
		return upt_date;
	}

	public void setUpt_date(String upt_date) {
		this.upt_date = upt_date;
	}

	public String getScType() {
		return scType;
	}

	public void setScType(String scType) {
		this.scType = scType;
	}

	public String getSrch_input() {
		return srch_input;
	}

	public void setSrch_input(String srch_input) {
		this.srch_input = srch_input;
	}

	public int getAnswer_no() {
		return answer_no;
	}

	public void setAnswer_no(int answer_no) {
		this.answer_no = answer_no;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public List<OptionVO> getOvo() {
		return ovo;
	}

	public void setOvo(List<OptionVO> ovo) {
		this.ovo = ovo;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public int getItem_title() {
		return item_title;
	}

	public void setItem_title(int item_title) {
		this.item_title = item_title;
	}

	public String getItem_contents() {
		return item_contents;
	}

	public void setItem_contents(String item_contents) {
		this.item_contents = item_contents;
	}

	public String getItem_type() {
		return item_type;
	}

	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	

}

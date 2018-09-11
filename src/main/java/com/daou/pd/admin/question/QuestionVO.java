package com.daou.pd.admin.question;

import java.util.List;

public class QuestionVO {

	private int q_seq;
	private String q_contents;
	private String q_type;
	private String reg_id;
	private String reg_date;
	private String upt_id;
	private String upt_date;
	private String use_yn;
	
	
	//private List<OptionVO> ovo;
	
	// 몇 번째가 정답인지 받아오는 변수
	private int answer_no;

	// 카테고리
	private int c_seq;
	private String c_name;

	// 검색
	private String scType;
	private String srch_input;

	
	/*
	public List<OptionVO> getOvo() {
		return ovo;
	}

	public void setOvo(List<OptionVO> ovo) {
		this.ovo = ovo;
	}*/
	
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

	public int getQ_seq() {
		return q_seq;
	}

	public void setQ_seq(int q_seq) {
		this.q_seq = q_seq;
	}

	public String getQ_contents() {
		return q_contents;
	}

	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}

	public String getQ_type() {
		return q_type;
	}

	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public int getC_seq() {
		return c_seq;
	}

	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	

}

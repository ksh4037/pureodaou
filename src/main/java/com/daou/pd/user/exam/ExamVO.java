package com.daou.pd.user.exam;

public class ExamVO {
	private int exam_degree;
	private int exam_category;
	private String category_name;
	private String exam_start_date;
	private String exam_end_date;
	private int exam_ox_num;
	private int exam_obj_num;
	private int exam_short_num;
	private int exam_pass_score;
	private ExamUserVO uservo;

	public ExamVO() {
	}

	public int getExam_degree() {
		return exam_degree;
	}

	public void setExam_degree(int exam_degree) {
		this.exam_degree = exam_degree;
	}

	public String getExam_start_date() {
		return exam_start_date;
	}

	public void setExam_start_date(String exam_start_date) {
		this.exam_start_date = exam_start_date;
	}

	public String getExam_end_date() {
		return exam_end_date;
	}

	public void setExam_end_date(String exam_end_date) {
		this.exam_end_date = exam_end_date;
	}

	public int getExam_ox_num() {
		return exam_ox_num;
	}

	public void setExam_ox_num(int exam_ox_num) {
		this.exam_ox_num = exam_ox_num;
	}

	public int getExam_obj_num() {
		return exam_obj_num;
	}

	public void setExam_obj_num(int exam_obj_num) {
		this.exam_obj_num = exam_obj_num;
	}

	public int getExam_short_num() {
		return exam_short_num;
	}

	public void setExam_short_num(int exam_short_num) {
		this.exam_short_num = exam_short_num;
	}

	public int getExam_pass_score() {
		return exam_pass_score;
	}

	public void setExam_pass_score(int exam_pass_score) {
		this.exam_pass_score = exam_pass_score;
	}

	public ExamUserVO getUservo() {
		return uservo;
	}

	public void setUservo(ExamUserVO uservo) {
		this.uservo = uservo;
	}

	public int getExam_category() {
		return exam_category;
	}

	public void setExam_category(int exam_category) {
		this.exam_category = exam_category;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

}

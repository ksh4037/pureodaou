package com.daou.pd.user.exam;

public class ExamListVO {
	private int exam_degree;
	private String category_name;
	private String exam_start_date;
	private String exam_end_date;
	private int exam_pass_score;
	private String exam_status;

	private int exam_retake_degree;
	private int exam_left_time;
	private String quiz_cfg_code_name;

	public int getExam_degree() {
		return exam_degree;
	}

	public void setExam_degree(int exam_degree) {
		this.exam_degree = exam_degree;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setExam_category(String category_name) {
		this.category_name = category_name;
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

	public int getExam_pass_score() {
		return exam_pass_score;
	}

	public void setExam_pass_score(int exam_pass_score) {
		this.exam_pass_score = exam_pass_score;
	}

	public int getExam_retake_degree() {
		return exam_retake_degree;
	}

	public void setExam_retake_degree(int exam_retake_degree) {
		this.exam_retake_degree = exam_retake_degree;
	}

	public int getExam_left_time() {
		return exam_left_time;
	}

	public void setExam_left_time(int exam_left_time) {
		this.exam_left_time = exam_left_time;
	}

	public String getQuiz_cfg_code_name() {
		return quiz_cfg_code_name;
	}

	public void setQuiz_cfg_code_name(String quiz_cfg_code_name) {
		this.quiz_cfg_code_name = quiz_cfg_code_name;
	}

	public String getExam_status() {
		return exam_status;
	}

	public void setExam_status(String exam_status) {
		this.exam_status = exam_status;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

}

package com.daou.pd.user.exam;

public class ExamDetailVO {
	private int exam_detail_no;
	private int exam_no;
	private int item_no;
	private int exam_detail_option1;
	private int exam_detail_option2;
	private int exam_detail_option3;
	private int exam_detail_option4;
	private String exam_detail_answer;
	private String exam_detail_correct;
	private String correct_yn;
	private String exam_detail_comment;

	public ExamDetailVO() {
	}

	public int getExam_detail_no() {
		return exam_detail_no;
	}

	public void setExam_detail_no(int exam_detail_no) {
		this.exam_detail_no = exam_detail_no;
	}

	public int getExam_no() {
		return exam_no;
	}

	public void setExam_no(int exam_no) {
		this.exam_no = exam_no;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public int getExam_detail_option1() {
		return exam_detail_option1;
	}

	public void setExam_detail_option1(int exam_detail_option1) {
		this.exam_detail_option1 = exam_detail_option1;
	}

	public int getExam_detail_option2() {
		return exam_detail_option2;
	}

	public void setExam_detail_option2(int exam_detail_option2) {
		this.exam_detail_option2 = exam_detail_option2;
	}

	public int getExam_detail_option3() {
		return exam_detail_option3;
	}

	public void setExam_detail_option3(int exam_detail_option3) {
		this.exam_detail_option3 = exam_detail_option3;
	}

	public int getExam_detail_option4() {
		return exam_detail_option4;
	}

	public void setExam_detail_option4(int exam_detail_option4) {
		this.exam_detail_option4 = exam_detail_option4;
	}

	public String getExam_detail_answer() {
		return exam_detail_answer;
	}

	public void setExam_detail_answer(String exam_detail_answer) {
		this.exam_detail_answer = exam_detail_answer;
	}

	public String getExam_detail_correct() {
		return exam_detail_correct;
	}

	public void setExam_detail_correct(String exam_detail_correct) {
		this.exam_detail_correct = exam_detail_correct;
	}

	public String getCorrect_yn() {
		return correct_yn;
	}

	public void setCorrect_yn(String correct_yn) {
		this.correct_yn = correct_yn;
	}

	public String getExam_detail_comment() {
		return exam_detail_comment;
	}

	public void setExam_detail_comment(String exam_detail_comment) {
		this.exam_detail_comment = exam_detail_comment;
	}

}

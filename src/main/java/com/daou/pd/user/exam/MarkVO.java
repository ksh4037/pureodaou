package com.daou.pd.user.exam;

public class MarkVO {
	private int item_no;
	private String exam_detail_answer;
	private int exam_no;
	private String exam_detail_correct;
	private String correct_yn;
	private String item_type;

	public MarkVO() {
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public String getExam_detail_answer() {
		return exam_detail_answer;
	}

	public void setExam_detail_answer(String exam_detail_answer) {
		this.exam_detail_answer = exam_detail_answer;
	}

	public int getExam_no() {
		return exam_no;
	}

	public void setExam_no(int exam_no) {
		this.exam_no = exam_no;
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

	public String getItem_type() {
		return item_type;
	}

	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}

}

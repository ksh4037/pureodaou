package com.daou.pd.user.exam;

public class ExamUserVO {
	private int exam_no;
	private int exam_degree; // 회차
	private String exam_take_id; // 응시자
	private String exam_take_date;
	private int exam_retake_degree;// 재시험 회차
	private int exam_left_time;
	private int exam_score;
	private String exam_status;
	private String status_name;
	private String exam_final_yn;
	private ExamDetailVO detail;

	public ExamUserVO() {
	}

	public int getExam_no() {
		return exam_no;
	}

	public void setExam_no(int exam_no) {
		this.exam_no = exam_no;
	}

	public int getExam_degree() {
		return exam_degree;
	}

	public void setExam_degree(int exam_degree) {
		this.exam_degree = exam_degree;
	}

	public String getExam_take_id() {
		return exam_take_id;
	}

	public void setExam_take_id(String exam_take_id) {
		this.exam_take_id = exam_take_id;
	}

	public String getExam_take_date() {
		return exam_take_date;
	}

	public void setExam_take_date(String exam_take_date) {
		this.exam_take_date = exam_take_date;
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

	public int getExam_score() {
		return exam_score;
	}

	public void setExam_score(int exam_score) {
		this.exam_score = exam_score;
	}

	public String getExam_status() {
		return exam_status;
	}

	public void setExam_status(String exam_status) {
		this.exam_status = exam_status;
	}

	public String getExam_final_yn() {
		return exam_final_yn;
	}

	public void setExam_final_yn(String exam_final_yn) {
		this.exam_final_yn = exam_final_yn;
	}

	public ExamDetailVO getDetail() {
		return detail;
	}

	public void setDetail(ExamDetailVO detail) {
		this.detail = detail;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	@Override
	public String toString() {
		return "ExamVO [exam_no=" + exam_no + ", exam_degree=" + exam_degree + ", exam_take_id=" + exam_take_id
				+ ", exam_take_date=" + exam_take_date + ", exam_retake_degree=" + exam_retake_degree
				+ ", exam_left_time=" + exam_left_time + ", exam_score=" + exam_score + ", exam_status=" + exam_status
				+ ", exam_final_yn=" + exam_final_yn + ", detail=" + detail + "]";
	}

}

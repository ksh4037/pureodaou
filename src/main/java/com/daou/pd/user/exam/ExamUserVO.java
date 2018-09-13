package com.daou.pd.user.exam;

public class ExamUserVO {
	private int exam_no;
	private int exam_degree; // 회차
	private String exam_take_id; // 응시자
	private String exam_teke_date;
	private int exam_retake_degree;// 재시험 회차
	private int exam_left_time;
	private int exam_score;
	private String exam_status;
	private String exam_final_yn;
	private ExamDetailVO detail;

	public ExamUserVO() {
	}

	public ExamUserVO(int exam_no, int exam_degree, String exam_take_id, String exam_teke_date, int exam_retake_degree,
			int exam_left_time, int exam_score, String exam_status, String exam_final_yn, ExamDetailVO detail) {
		super();
		this.exam_no = exam_no;
		this.exam_degree = exam_degree;
		this.exam_take_id = exam_take_id;
		this.exam_teke_date = exam_teke_date;
		this.exam_retake_degree = exam_retake_degree;
		this.exam_left_time = exam_left_time;
		this.exam_score = exam_score;
		this.exam_status = exam_status;
		this.exam_final_yn = exam_final_yn;
		this.detail = detail;
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

	public String getExam_teke_date() {
		return exam_teke_date;
	}

	public void setExam_teke_date(String exam_teke_date) {
		this.exam_teke_date = exam_teke_date;
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

	@Override
	public String toString() {
		return "ExamVO [exam_no=" + exam_no + ", exam_degree=" + exam_degree + ", exam_take_id=" + exam_take_id
				+ ", exam_teke_date=" + exam_teke_date + ", exam_retake_degree=" + exam_retake_degree
				+ ", exam_left_time=" + exam_left_time + ", exam_score=" + exam_score + ", exam_status=" + exam_status
				+ ", exam_final_yn=" + exam_final_yn + ", detail=" + detail + "]";
	}

}

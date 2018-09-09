package com.daou.pd.user.exam;

import java.sql.Date;

public class ExamVO {
	private int exam_test_no; // 회차
	private String reg_id; // 응시자
	private int problem_seq;// 시퀀스
	private int option1; // 보기1
	private int option2; // 보기2
	private int option3; // 보기3
	private int option4; // 보기4
	private String e_answer; // 체크한 답
	private String correct; // 정답여부
	private Date reg_date; // 응시날짜

	public ExamVO() {
	}

	public ExamVO(int exam_test_no, String reg_id, int problem_seq, int option1, int option2, int option3, int option4,
			String e_answer, String correct, Date reg_date) {
		super();
		this.exam_test_no = exam_test_no;
		this.reg_id = reg_id;
		this.problem_seq = problem_seq;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.e_answer = e_answer;
		this.correct = correct;
		this.reg_date = reg_date;
	}

	public int getExam_test_no() {
		return exam_test_no;
	}

	public void setExam_test_no(int exam_test_no) {
		this.exam_test_no = exam_test_no;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public int getProblem_seq() {
		return problem_seq;
	}

	public void setProblem_seq(int problem_seq) {
		this.problem_seq = problem_seq;
	}

	public int getOption1() {
		return option1;
	}

	public void setOption1(int option1) {
		this.option1 = option1;
	}

	public int getOption2() {
		return option2;
	}

	public void setOption2(int option2) {
		this.option2 = option2;
	}

	public int getOption3() {
		return option3;
	}

	public void setOption3(int option3) {
		this.option3 = option3;
	}

	public int getOption4() {
		return option4;
	}

	public void setOption4(int option4) {
		this.option4 = option4;
	}

	public String getE_answer() {
		return e_answer;
	}

	public void setE_answer(String e_answer) {
		this.e_answer = e_answer;
	}

	public String getCorrect() {
		return correct;
	}

	public void setCorrect(String correct) {
		this.correct = correct;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "ExamVO [exam_test_no=" + exam_test_no + ", reg_id=" + reg_id + ", problem_seq=" + problem_seq
				+ ", option1=" + option1 + ", option2=" + option2 + ", option3=" + option3 + ", option4=" + option4
				+ ", e_answer=" + e_answer + ", correct=" + correct + ", reg_date=" + reg_date + "]";
	}

}

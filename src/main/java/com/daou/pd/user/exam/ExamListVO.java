package com.daou.pd.user.exam;

public class ExamListVO {
	private int exam_test_no;
	private String s_date;
	private String e_date;
	private int ox_num;
	private int obj_num;

	public ExamListVO() {
	}

	public ExamListVO(int exam_test_no, String s_date, String e_date, int ox_num, int obj_num) {
		super();
		this.exam_test_no = exam_test_no;
		this.s_date = s_date;
		this.e_date = e_date;
		this.ox_num = ox_num;
		this.obj_num = obj_num;
	}

	public int getExam_test_no() {
		return exam_test_no;
	}

	public void setExam_test_no(int exam_test_no) {
		this.exam_test_no = exam_test_no;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getE_date() {
		return e_date;
	}

	public void setE_date(String e_date) {
		this.e_date = e_date;
	}

	public int getOx_num() {
		return ox_num;
	}

	public void setOx_num(int ox_num) {
		this.ox_num = ox_num;
	}

	public int getObj_num() {
		return obj_num;
	}

	public void setObj_num(int obj_num) {
		this.obj_num = obj_num;
	}

	@Override
	public String toString() {
		return "ExamListVO [exam_test_no=" + exam_test_no + ", s_date=" + s_date + ", e_date=" + e_date + ", ox_num="
				+ ox_num + ", obj_num=" + obj_num + "]";
	}

}

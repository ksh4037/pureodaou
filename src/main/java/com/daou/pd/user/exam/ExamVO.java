package com.daou.pd.user.exam;

public class ExamVO {
	private int exam_degree;
	private String exam_category;
	private String exam_start_date;
	private String exam_end_date;
	private int exam_ox_num;
	private int exam_obj_num;
	private int exam_short_num;
	private int exam_pass_score;
	private ExamUserVO uservo;
	private int item_no;
	private int fail_count;
	private int total_count;
	private float result;

	private String emp_dept;
	private String emp_grade;
	// 통계 : 부서검색, 직급검색
	private String dept_scType;
	private String grade_scType;

	public ExamVO() {
	}

	public int getExam_degree() {
		return exam_degree;
	}

	public void setExam_degree(int exam_degree) {
		this.exam_degree = exam_degree;
	}

	public String getExam_category() {
		return exam_category;
	}

	public void setExam_category(String exam_category) {
		this.exam_category = exam_category;
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

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public int getFail_count() {
		return fail_count;
	}

	public void setFail_count(int fail_count) {
		this.fail_count = fail_count;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public float getResult() {
		return result;
	}

	public void setResult(float result) {
		this.result = result;
	}

	public String getEmp_dept() {
		return emp_dept;
	}

	public void setEmp_dept(String emp_dept) {
		this.emp_dept = emp_dept;
	}

	public String getEmp_grade() {
		return emp_grade;
	}

	public void setEmp_grade(String emp_grade) {
		this.emp_grade = emp_grade;
	}

	public String getDept_scType() {
		return dept_scType;
	}

	public void setDept_scType(String dept_scType) {
		this.dept_scType = dept_scType;
	}

	public String getGrade_scType() {
		return grade_scType;
	}

	public void setGrade_scType(String grade_scType) {
		this.grade_scType = grade_scType;
	}

}

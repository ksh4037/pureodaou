package com.daou.pd.user.exam;

public class MarkVO {
	private int problem;
	private String answer;
	private int degree;

	public MarkVO() {
	}

	public MarkVO(int problem, String answer, int degree) {
		super();
		this.problem = problem;
		this.answer = answer;
		this.degree = degree;
	}

	public int getProblem() {
		return problem;
	}

	public void setProblem(int problem) {
		this.problem = problem;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getDegree() {
		return degree;
	}

	public void setDegree(int degree) {
		this.degree = degree;
	}

	@Override
	public String toString() {
		return "MarkVO [problem=" + problem + ", answer=" + answer + ", degree=" + degree + "]";
	}

}

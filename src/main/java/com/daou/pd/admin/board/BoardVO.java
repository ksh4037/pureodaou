package com.daou.pd.admin.board;


public class BoardVO {
	private int item_no;
	private int fail_count;
	private int total_count;
	private float result;
	
	
	public BoardVO(int item_no, int fail_count, int total_count, float result) {
		super();
		this.item_no = item_no;
		this.fail_count = fail_count;
		this.total_count = total_count;
		this.result = result;
	}
	
	public BoardVO() {
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
	
	

}

package com.daou.pd.admin.board;


public class BoardVO {
	private int item_no;
	private int fail_cnt;
	private int total_cnt;
	private float result;
	
	
	
	public BoardVO(int item_no, int fail_cnt, int total_cnt, float result) {
		super();
		this.item_no = item_no;
		this.fail_cnt = fail_cnt;
		this.total_cnt = total_cnt;
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


	public int getFail_cnt() {
		return fail_cnt;
	}

	public void setFail_cnt(int fail_cnt) {
		this.fail_cnt = fail_cnt;
	}

	public int getTotal_cnt() {
		return total_cnt;
	}

	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}

	public float getResult() {
		return result;
	}

	public void setResult(float result) {
		this.result = result;
	}
	
	

}

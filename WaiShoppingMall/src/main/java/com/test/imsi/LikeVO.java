package com.test.imsi;

public class LikeVO {
	
	private int r_num;
	private String id1;
	private int check_like;
	
	public LikeVO() {}
	
	public LikeVO(int r_num,String id1,int check_like) {
		this.r_num=r_num;
		this.id1=id1;
		this.check_like=check_like;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getId1() {
		return id1;
	}

	public void setId1(String id1) {
		this.id1 = id1;
	}

	public int getCheck_like() {
		return check_like;
	}

	public void setCheck_like(int check_like) {
		this.check_like = check_like;
	}

}

package com.test.imsi;

public class OrderhistoryVO {
	
	private int orderno;
	private String id;
	private String productsubject;
	private String productcolor;
	private String productsize;
	private int productprice;
	private int productamount;
	private String stored_fname;
	private String orderstate;
	private String orderdate;
	
	
	public OrderhistoryVO()
	{	}
	
	public OrderhistoryVO(int orderno, String id, String productsubject, String productcolor, String productsize,
			int productprice, int productamount, String stored_fname, String orderstate , String orderdate) 
	{
		super();
		this.orderno = orderno;
		this.id = id;
		this.productsubject = productsubject;
		this.productcolor = productcolor;
		this.productsize = productsize;
		this.productprice = productprice;
		this.productamount = productamount;
		this.stored_fname = stored_fname;
		this.orderstate = orderstate;
		this.orderdate = orderdate;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductsubject() {
		return productsubject;
	}
	public void setProductsubject(String productsubject) {
		this.productsubject = productsubject;
	}
	public String getProductcolor() {
		return productcolor;
	}
	public void setProductcolor(String productcolor) {
		this.productcolor = productcolor;
	}
	public String getProductsize() {
		return productsize;
	}
	public void setProductsize(String productsize) {
		this.productsize = productsize;
	}
	public int getProductprice() {
		return productprice;
	}
	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}
	public int getProductamount() {
		return productamount;
	}
	public void setProductamount(int productamount) {
		this.productamount = productamount;
	}
	public String getStored_fname() {
		return stored_fname;
	}
	public void setStored_fname(String stored_fname) {
		this.stored_fname = stored_fname;
	}
	public String getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(String orderstate) {
		this.orderstate = orderstate;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
}

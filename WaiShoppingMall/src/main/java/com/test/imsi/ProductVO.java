package com.test.imsi;

public class ProductVO {
	private int productno;
	private String productcode;
	private String productcolor;
	private String productsize;
	private int productstock;
	private String productcategory;
	private String productgender;
	private String productsubject;
	private String productcontents;
	private String original_fname;
	private String stored_fname;
	private String productdate;
	private double productstar;
	private int productprice;
	
	public ProductVO()
	{	}
	
	public ProductVO(int productno , String productcode, String productcolor, String productsize, int productstock,
			String productcategory, String productgender, String productsubject, String productcontents,
			String original_fname, String stored_fname, String productdate, double productstar, int productprice) {
		super();
		this.productno = productno;
		this.productcode = productcode;
		this.productcolor = productcolor;
		this.productsize = productsize;
		this.productstock = productstock;
		this.productcategory = productcategory;
		this.productgender = productgender;
		this.productsubject = productsubject;
		this.productcontents = productcontents;
		this.original_fname = original_fname;
		this.stored_fname = stored_fname;
		this.productdate = productdate;
		this.productstar = productstar;
		this.productprice = productprice;
	}
	
	public int getProductno()
	{
		return productno;
	}
	public void setProductno(int productno)
	{
		this.productno = productno;
	}
	public String getProductcode() {
		return productcode;
	}
	public void setProductcode(String productcode) {
		this.productcode = productcode;
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
	public int getProductstock() {
		return productstock;
	}
	public void setProductstock(int productstock) {
		this.productstock = productstock;
	}
	public String getProductcategory() {
		return productcategory;
	}
	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}
	public String getProductgender() {
		return productgender;
	}
	public void setProductgender(String productgender) {
		this.productgender = productgender;
	}
	public String getProductsubject() {
		return productsubject;
	}
	public void setProductsubject(String productsubject) {
		this.productsubject = productsubject;
	}
	public String getProductcontents() {
		return productcontents;
	}
	public void setProductcontents(String productcontents) {
		this.productcontents = productcontents;
	}
	public String getOriginal_fname() {
		return original_fname;
	}
	public void setOriginal_fname(String original_fname) {
		this.original_fname = original_fname;
	}
	public String getStored_fname() {
		return stored_fname;
	}
	public void setStored_fname(String stored_fname) {
		this.stored_fname = stored_fname;
	}
	public String getProductdate() {
		return productdate;
	}
	public void setProductdate(String productdate) {
		this.productdate = productdate;
	}
	public double getProductstar() {
		return productstar;
	}
	public void setProductstar(double productstar) {
		this.productstar = productstar;
	}
	public int getProductprice() {
		return productprice;
	}
	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}
	
	
}

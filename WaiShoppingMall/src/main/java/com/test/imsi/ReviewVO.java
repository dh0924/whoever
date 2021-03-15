package com.test.imsi;

public class ReviewVO {
	
	private int r_num;
	private String r_grade;
	private String r_sangpum;
	private String r_size;
	private String r_title;
	private String r_text;
	private String r_writer;
	private String original_fname;
	private String stored_fname;
	private String r_date;
	private double r_star;
	private int r_good;
	private int r_bad;
	private int r_check;
	private int r_standard;
	
	public ReviewVO() {}
	
	public ReviewVO(int r_num, String r_grade,String r_sangpum,String r_size,String r_title, String r_text,String r_writer, String original_fname, String stored_fname,String r_date,double r_star, int r_good,int r_bad,int r_check, int r_standard) {
	this.r_num=r_num;
	this.r_grade=r_grade;
	this.r_sangpum=r_sangpum;
	this.r_size=r_size;
	this.r_title=r_title;
	this.r_text=r_text;
	this.r_writer = r_writer;
	this.original_fname=original_fname;
	this.stored_fname=stored_fname;
	this.r_date=r_date;
	this.r_star=r_star;
	this.r_good=r_good;
	this.r_bad=r_bad;
	this.r_check=r_check;
	this.r_standard=r_standard;
	}

	
	
	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_text() {
		return r_text;
	}

	public void setR_text(String r_text) {
		this.r_text = r_text;
	}

	public double getR_star() {
		return r_star;
	}

	public void setR_star(double r_star) {
		this.r_star = r_star;
	}

	public int getR_good() {
		return r_good;
	}

	public void setR_good(int r_good) {
		this.r_good = r_good;
	}

	public int getR_bad() {
		return r_bad;
	}

	public void setR_bad(int r_bad) {
		this.r_bad = r_bad;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
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

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getR_sangpum() {
		return r_sangpum;
	}

	public void setR_sangpum(String r_sangpum) {
		this.r_sangpum = r_sangpum;
	}

	public int getR_check() {
		return r_check;
	}

	public void setR_check(int r_check) {
		this.r_check = r_check;
	}

	public String getR_grade() {
		return r_grade;
	}

	public void setR_grade(String r_grade) {
		this.r_grade = r_grade;
	}

	public String getR_size() {
		return r_size;
	}

	public void setR_size(String r_size) {
		this.r_size = r_size;
	}

	public int getR_standard() {
		return r_standard;
	}

	public void setR_standard(int r_standard) {
		this.r_standard = r_standard;
	}
	
}

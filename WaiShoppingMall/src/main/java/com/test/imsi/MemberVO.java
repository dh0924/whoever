package com.test.imsi;

import java.util.Date;

public class MemberVO {

	private String name;
	private String id;
	private String pw;
	private String hp1;
	private String hp2;
	private String hp3;
	private String ad1;
	private String ad2;
	private String ad3;
	private String email;
	private String r_num1;
	private String r_num2;
	private Date m_date;
	private String gender;
	private String admin;
	private String grade;
	private int point;
	private int a_point;

	public MemberVO() {
		super();
	}

	public MemberVO(String name, String id, String pw, String hp1, String hp2, String hp3, String ad1, String ad2,
			String ad3, String email, String r_num1, String r_num2, Date m_date, String gender, String admin,
			String grade, int point, int a_point) {
		super();
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.ad1 = ad1;
		this.ad2 = ad2;
		this.ad3 = ad3;
		this.email = email;
		this.r_num1 = r_num1;
		this.r_num2 = r_num2;
		this.m_date = m_date;
		this.gender = gender;
		this.admin = admin;
		this.grade = grade;
		this.point = point;
		this.a_point = a_point;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}

	public String getAd1() {
		return ad1;
	}

	public void setAd1(String ad1) {
		this.ad1 = ad1;
	}

	public String getAd2() {
		return ad2;
	}

	public void setAd2(String ad2) {
		this.ad2 = ad2;
	}

	public String getAd3() {
		return ad3;
	}

	public void setAd3(String ad3) {
		this.ad3 = ad3;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getR_num1() {
		return r_num1;
	}

	public void setR_num1(String r_num1) {
		this.r_num1 = r_num1;
	}

	public String getR_num2() {
		return r_num2;
	}

	public void setR_num2(String r_num2) {
		this.r_num2 = r_num2;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getA_point() {
		return a_point;
	}

	public void setA_point(int a_point) {
		this.a_point = a_point;
	}

	

}
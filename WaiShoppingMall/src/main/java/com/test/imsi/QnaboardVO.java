package com.test.imsi;

import java.util.Date;

public class QnaboardVO {
	private int qnano;
	private String qnakind;
	private String qnasubject;
	private String qnacontents;
	private String qnadate;
	private int qnalock;
	private int qnaanswer;
	private String memberid;
	private String productcode;
	private String qnaanswercontents;
	
	public QnaboardVO()
	{	}
	
	public QnaboardVO(int qnano, String qnakind, String qnasubject, String qnacontents, String qnadate, int qnalock,
			int qnaanswer, String memberid, String productcode , String qnaanswercontents) 
	{
		super();
		this.qnano = qnano;
		this.qnakind = qnakind;
		this.qnasubject = qnasubject;
		this.qnacontents = qnacontents;
		this.qnadate = qnadate;
		this.qnalock = qnalock;
		this.qnaanswer = qnaanswer;
		this.memberid = memberid;
		this.productcode = productcode;
		this.qnaanswercontents = qnaanswercontents;
	}
	
	public int getQnano() {
		return qnano;
	}
	public void setQnano(int qnano) {
		this.qnano = qnano;
	}
	public String getQnakind() {
		return qnakind;
	}
	public void setQnakind(String qnakind) {
		this.qnakind = qnakind;
	}
	public String getQnasubject() {
		return qnasubject;
	}
	public void setQnasubject(String qnasubject) {
		this.qnasubject = qnasubject;
	}
	public String getQnacontents() {
		return qnacontents;
	}
	public void setQnacontents(String qnacontents) {
		this.qnacontents = qnacontents;
	}
	public String getQnadate() {
		return qnadate;
	}
	public void setQnadate(String qnadate) {
		this.qnadate = qnadate;
	}
	public int getQnalock() {
		return qnalock;
	}
	public void setQnalock(int qnalock) {
		this.qnalock = qnalock;
	}
	public int getQnaanswer() {
		return qnaanswer;
	}
	public void setQnaanswer(int qnaanswer) {
		this.qnaanswer = qnaanswer;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getProductcode() {
		return productcode;
	}
	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}
	public String getQnaanswercontents()
	{
		return qnaanswercontents;
	}
	public void setQnaanswercontents(String qnaanswercontents)
	{
		this.qnaanswercontents = qnaanswercontents;
	}
	
	
}

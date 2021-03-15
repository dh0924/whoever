package com.test.imsi;

import java.util.Date;

public class NoticeboardVO {
	private int noticeno;
	private String noticesubject;
	private String noticecontents;
	private String noticeid;
	private String noticedate;
	
	public NoticeboardVO()
	{	}

	public NoticeboardVO(int noticeno, String noticesubject, String noticecontents, String noticeid, String noticedate) 
	{
		super();
		this.noticeno = noticeno;
		this.noticesubject = noticesubject;
		this.noticecontents = noticecontents;
		this.noticeid = noticeid;
		this.noticedate = noticedate;
	}

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	
	public String getNoticeid() {
		return noticeid;
	}

	public void setNoticeid(String noticeid) {
		this.noticeid = noticeid;
	}

	public String getNoticesubject() {
		return noticesubject;
	}

	public void setNoticesubject(String noticesubject) {
		this.noticesubject = noticesubject;
	}

	public String getNoticecontents() {
		return noticecontents;
	}

	public void setNoticecontents(String noticecontents) {
		this.noticecontents = noticecontents;
	}

	public String getNoticedate() {
		return noticedate;
	}

	public void setNoticedate(String noticedate) {
		this.noticedate = noticedate;
	}
	
	
	
	
}

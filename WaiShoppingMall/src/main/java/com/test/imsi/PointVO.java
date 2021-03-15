package com.test.imsi;

import java.util.Date;

public class PointVO {

	private String id;
	private String point;
	private String contents;
	private String time;
	
	public PointVO() {
		super();
	}

	public PointVO(String id, String point, String contents, String time) {
		super();
		this.id = id;
		this.point = point;
		this.contents = contents;
		this.time = time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}	
}
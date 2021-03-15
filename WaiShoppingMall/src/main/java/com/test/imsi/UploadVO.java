package com.test.imsi;

public class UploadVO {

	private int uno;
	private String productcode;
	private String original_fname;
	private String stored_fname;
	
	public UploadVO()
	{	}
	
	public UploadVO(int uno, String productcode, String original_fname, String stored_fname)
	{
		super();
		this.uno = uno;
		this.productcode = productcode;
		this.original_fname = original_fname;
		this.stored_fname = stored_fname;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getProductcode() {
		return productcode;
	}

	public void setProductcode(String productcode) {
		this.productcode = productcode;
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

}

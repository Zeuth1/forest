package com.kh.forest.main.model.vo;

import java.sql.Date;

import org.springframework.context.annotation.Configuration;



@Configuration
public class History {
	private String mno;
	private String item;
	private String hno;
	private Date hDate;
	public String getHno() {
		return hno;
	}

	public void setHno(String hno) {
		this.hno = hno;
	}

	public Date gethDate() {
		return hDate;
	}

	public void sethDate(Date hDate) {
		this.hDate = hDate;
	}

	public History(){}
	
	public History(String mno, String item) {
		super();
		this.mno = mno;
		this.item = item;
	}
	
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "History [mno=" + mno + ", item=" + item + ", hno=" + hno + ", hDate=" + hDate + "]";
	}

	public History(String mno, String item, String hno, Date hDate) {
		super();
		this.mno = mno;
		this.item = item;
		this.hno = hno;
		this.hDate = hDate;
	}
	

	
}

package com.kh.forest.main.model.vo;

public class History {
	private String mno;
	private String item;
	
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
		return "History [mno=" + mno + ", item=" + item + "]";
	}
	
	
}

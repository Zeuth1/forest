package com.kh.forest.common;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Tree {

	
	public Tree(){}
	
	private int tNo; //트리번호
	private int mNo; //맴버번호
	private String bName; //사진파일이전이름
	private String aName; //사진파일이후이름
	private String tag; //태그
	private String tType; //공개여부
	private Date tDate; //게시일
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String gettType() {
		return tType;
	}
	public void settType(String tType) {
		this.tType = tType;
	}
	public Date gettDate() {
		return tDate;
	}
	public void settDate(Date tDate) {
		this.tDate = tDate;
	}
	public Tree(int tNo, int mNo, String bName, String aName, String tag, String tType, Date tDate) {
		super();
		this.tNo = tNo;
		this.mNo = mNo;
		this.bName = bName;
		this.aName = aName;
		this.tag = tag;
		this.tType = tType;
		this.tDate = tDate;
	}
	@Override
	public String toString() {
		return "Tree [tNo=" + tNo + ", mNo=" + mNo + ", bName=" + bName + ", aName=" + aName + ", tag=" + tag
				+ ", tType=" + tType + ", tDate=" + tDate + "]";
	}
	
	
	
	
	
}

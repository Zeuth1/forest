package com.kh.forest.setting.model.vo;

import java.sql.Date;


import org.springframework.stereotype.Component;

@Component
public class Notice2 {

	
	String nNo;//글번호
	String mNo;//맴버번호
	String nTitle; 
	String nContent;
	String nType;
	Date nDate;
	public Notice2(){}
	
	public Notice2(String nNo, String mNo, String nTitle, String nContent, String nType, Date nDate) {
		super();
		this.nNo = nNo;
		this.mNo = mNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nType = nType;
		this.nDate = nDate;
	}
	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", mNo=" + mNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nType="
				+ nType + ", nDate=" + nDate + "]";
	}
	public String getnNo() {
		return nNo;
	}
	public void setnNo(String nNo) {
		this.nNo = nNo;
	}
	public String getmNo() {
		return mNo;
	}
	public void setmNo(String mNo) {
		this.mNo = mNo;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getnType() {
		return nType;
	}
	public void setnType(String nType) {
		this.nType = nType;
	}
	public Date getnDate() {
		return nDate;
	}
	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}
	
	
}

	package com.kh.forest.main.model.vo;

import java.sql.Date;

public class Detail implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6551229277220848195L;
	private String mno;
	private String treeNo;
	private String treeAfter;
	private String mNickName;
	private String treeTag;
	private String treeType;
	private Date treeDate;
	private String boardTitle;
	private String treeCtn;
	
	public Detail(){}
	
	public Detail(String mno, String treeNo, String treeAfter, String mNickName, String treeTag, String treeType, Date treeDate,
			String boardTitle, String treeCtn) {
		super();
		this.mno = mno;
		this.treeNo = treeNo;
		this.treeAfter = treeAfter;
		this.mNickName = mNickName;
		this.treeTag = treeTag;
		this.treeType = treeType;
		this.treeDate = treeDate;
		this.boardTitle = boardTitle;
		this.treeCtn = treeCtn;
	}
	
	

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getTreeNo() {
		return treeNo;
	}

	public void setTreeNo(String treeNo) {
		this.treeNo = treeNo;
	}

	public String getTreeAfter() {
		return treeAfter;
	}

	public void setTreeAfter(String treeAfter) {
		this.treeAfter = treeAfter;
	}

	public String getmNickName() {
		return mNickName;
	}

	public void setmNickName(String mNickName) {
		this.mNickName = mNickName;
	}

	public String getTreeTag() {
		return treeTag;
	}

	public void setTreeTag(String treeTag) {
		this.treeTag = treeTag;
	}

	public String getTreeType() {
		return treeType;
	}

	public void setTreeType(String treeType) {
		this.treeType = treeType;
	}

	public Date getTreeDate() {
		return treeDate;
	}

	public void setTreeDate(Date treeDate) {
		this.treeDate = treeDate;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getTreeCtn() {
		return treeCtn;
	}

	public void setTreeCtn(String treeCtn) {
		this.treeCtn = treeCtn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Detail [mno=" + mno + ", treeNo=" + treeNo + ", treeAfter=" + treeAfter + ", mNickName=" + mNickName
				+ ", treeTag=" + treeTag + ", treeType=" + treeType + ", treeDate=" + treeDate + ", boardTitle="
				+ boardTitle + ", treeCtn=" + treeCtn + "]";
	}

	
	
	
	
}

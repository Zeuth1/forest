package com.kh.forest.common;

public class CommentaryModel {
	private String userNo;
	private String treeNo;
	private String content;
	
	public CommentaryModel(){}
	
	public CommentaryModel(String userNo, String treeNo, String content) {
		super();
		this.userNo = userNo;
		this.treeNo = treeNo;
		this.content = content;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getTreeNo() {
		return treeNo;
	}
	public void setTreeNo(String treeNo) {
		this.treeNo = treeNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "CommentaryModel [userNo=" + userNo + ", treeNo=" + treeNo + ", content=" + content + "]";
	}
	
	
	
	
}

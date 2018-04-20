package com.kh.forest.myboard.model.vo;

import java.sql.Date;

public class Fin {
	private String Tree_No;			//트리번호
	private String User_No;			//트리소유주번호
	private String Tree_Before;		//트리원본이름
	private String Tree_After;		//트리바뀐이름
	private String Tree_Tag;		//트리태그
	private String Tree_Type;		//공개여부
	private Date Tree_Date;			//트리생성일
	
	public Fin(){
		
	}
	public Fin(String tree_No, String user_No, String tree_Before, String tree_After, String tree_Tag, String tree_Type,
			Date tree_Date) {
		super();
		Tree_No = tree_No;
		User_No = user_No;
		Tree_Before = tree_Before;
		Tree_After = tree_After;
		Tree_Tag = tree_Tag;
		Tree_Type = tree_Type;
		Tree_Date = tree_Date;
	}

	public String getTree_No() {
		return Tree_No;
	}

	public void setTree_No(String tree_No) {
		Tree_No = tree_No;
	}

	public String getUser_No() {
		return User_No;
	}

	public void setUser_No(String user_No) {
		User_No = user_No;
	}

	public String getTree_Before() {
		return Tree_Before;
	}

	public void setTree_Before(String tree_Before) {
		Tree_Before = tree_Before;
	}

	public String getTree_After() {
		return Tree_After;
	}

	public void setTree_After(String tree_After) {
		Tree_After = tree_After;
	}

	public String getTree_Tag() {
		return Tree_Tag;
	}

	public void setTree_Tag(String tree_Tag) {
		Tree_Tag = tree_Tag;
	}

	public String getTree_Type() {
		return Tree_Type;
	}

	public void setTree_Type(String tree_Type) {
		Tree_Type = tree_Type;
	}

	public Date getTree_Date() {
		return Tree_Date;
	}

	public void setTree_Date(Date tree_Date) {
		Tree_Date = tree_Date;
	}

	@Override
	public String toString() {
		return "Fin [Tree_No=" + Tree_No + ", User_No=" + User_No + ", Tree_Before=" + Tree_Before + ", Tree_After="
				+ Tree_After + ", Tree_Tag=" + Tree_Tag + ", Tree_Type=" + Tree_Type + ", Tree_Date=" + Tree_Date + "]";
	}
	
}

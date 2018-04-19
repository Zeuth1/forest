package com.kh.forest.helpcenter.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Commentary implements java.io.Serializable{
	
	private String comment_no;
	private String comment_content;
	private String notice_no;
	private String tree_no;
	private String user_no;
	
	// 임시
	private String user_id;
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	public Commentary(){};
	
	public Commentary(String comment_no, String comment_content, String notice_no, String tree_no, String user_no) {
		super();
		this.comment_no = comment_no;
		this.comment_content = comment_content;
		this.notice_no = notice_no;
		this.tree_no = tree_no;
		this.user_no = user_no;
	}
 
	
	public String getComment_no() {
		return comment_no;
	}
	public void setComment_no(String comment_no) {
		this.comment_no = comment_no;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	public String getTree_no() {
		return tree_no;
	}
	public void setTree_no(String tree_no) {
		this.tree_no = tree_no;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "Commentary [comment_no=" + comment_no + ", comment_content=" + comment_content + ", notice_no="
				+ notice_no + ", tree_no=" + tree_no + ", user_no=" + user_no + "]";
	}


	
	

}

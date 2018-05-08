package com.kh.forest.common;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Commentary implements java.io.Serializable{
	
	private String comment_no;
	private String comment_content;
	private String notice_no;
	private String tree_no;
	private String nick_name;
	private String user_no;
	private String comment_date;
	private String tree_after;
	private String children;
	private String user_id;
	
	// 임시
	
	
	
	public Commentary(){}

	public Commentary(String comment_no, String comment_content, String notice_no, String tree_no, String nick_name,
			String user_no, String comment_date, String tree_after, String children, String user_id) {
		super();
		this.comment_no = comment_no;
		this.comment_content = comment_content;
		this.notice_no = notice_no;
		this.tree_no = tree_no;
		this.nick_name = nick_name;
		this.user_no = user_no;
		this.comment_date = comment_date;
		this.tree_after = tree_after;
		this.children = children;
		this.user_id = user_id;
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

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getTree_after() {
		return tree_after;
	}

	public void setTree_after(String tree_after) {
		this.tree_after = tree_after;
	}

	public String getChildren() {
		return children;
	}

	public void setChildren(String children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "Commentary [comment_no=" + comment_no + ", comment_content=" + comment_content + ", notice_no="
				+ notice_no + ", tree_no=" + tree_no + ", nick_name=" + nick_name + ", user_no=" + user_no
				+ ", comment_date=" + comment_date + ", tree_after=" + tree_after + ", children=" + children
				+ ", user_id=" + user_id + "]";
	}



	
	

	
	
	

	
	

}

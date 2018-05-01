package com.kh.forest.manager.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Report {
	private int ban_no;
	private int user_id;
	private int tree_no;
	private String ban_reason;
	private String ban_result;
	private String status;
	private Date ban_date;
	

	public Date getBan_date() {
		return ban_date;
	}

	public void setBan_date(Date ban_date) {
		this.ban_date = ban_date;
	}

	public int getBan_no() {
		return ban_no;
	}

	public void setBan_no(int ban_no) {
		this.ban_no = ban_no;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getTree_no() {
		return tree_no;
	}

	public void setTree_no(int tree_no) {
		this.tree_no = tree_no;
	}

	public String getBan_reason() {
		return ban_reason;
	}

	public void setBan_reason(String ban_reason) {
		this.ban_reason = ban_reason;
	}

	public String getBan_result() {
		return ban_result;
	}

	public void setBan_result(String ban_result) {
		this.ban_result = ban_result;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}



	public Report(int ban_no, int user_id, int tree_no, String ban_reason, String ban_result, String status,
			Date ban_date) {
		super();
		this.ban_no = ban_no;
		this.user_id = user_id;
		this.tree_no = tree_no;
		this.ban_reason = ban_reason;
		this.ban_result = ban_result;
		this.status = status;
		this.ban_date = ban_date;
	}

	@Override
	public String toString() {
		return "Report [ban_no=" + ban_no + ", user_id=" + user_id + ", tree_no=" + tree_no + ", ban_reason="
				+ ban_reason + ", ban_result=" + ban_result + ", status=" + status + ", ban_date=" + ban_date + "]";
	}

	public Report() {
		// TODO Auto-generated constructor stub
	}
}

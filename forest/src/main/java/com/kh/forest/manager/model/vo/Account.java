package com.kh.forest.manager.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Account {
	private int rownum;
	private String user_name;
	private String bank_no;
	private String account_no;
	private String account_info;
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getuser_name() {
		return user_name;
	}
	public void setuser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getBank_no() {
		return bank_no;
	}
	public void setBank_no(String bank_no) {
		this.bank_no = bank_no;
	}
	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	public String getAccount_info() {
		return account_info;
	}
	public void setAccount_info(String account_info) {
		this.account_info = account_info;
	}
	@Override
	public String toString() {
		return "Account [rownum=" + rownum + ", user_name=" + user_name + ", bank_no=" + bank_no + ", account_no="
				+ account_no + ", account_info=" + account_info + "]";
	}
	public Account(int rownum, String user_name, String bank_no, String account_no, String account_info) {
		super();
		this.rownum = rownum;
		this.user_name = user_name;
		this.bank_no = bank_no;
		this.account_no = account_no;
		this.account_info = account_info;
	}

	public Account() {
		// TODO Auto-generated constructor stub
	}
}

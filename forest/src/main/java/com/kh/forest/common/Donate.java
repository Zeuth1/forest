package com.kh.forest.common;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Donate {
	private int donate_no;
	private String giver_Nick;
	private String taker_Nick;
	private Date donate_date;
	private int donate_amount;
	public int getDonate_no() {
		return donate_no;
	}
	public void setDonate_no(int donate_no) {
		this.donate_no = donate_no;
	}
	public String getGiver_Nick() {
		return giver_Nick;
	}
	public void setGiver_Nick(String giver_Nick) {
		this.giver_Nick = giver_Nick;
	}
	public String getTaker_Nick() {
		return taker_Nick;
	}
	public void setTaker_Nick(String taker_Nick) {
		this.taker_Nick = taker_Nick;
	}
	public Date getDonate_date() {
		return donate_date;
	}
	public void setDonate_date(Date donate_date) {
		this.donate_date = donate_date;
	}
	public int getDonate_amount() {
		return donate_amount;
	}
	public void setDonate_amount(int donate_amount) {
		this.donate_amount = donate_amount;
	}
	@Override
	public String toString() {
		return "Donate [donate_no=" + donate_no + ", giver_Nick=" + giver_Nick + ", taker_Nick=" + taker_Nick
				+ ", donate_date=" + donate_date + ", donate_amount=" + donate_amount + "]";
	}
	public Donate(int donate_no, String giver_Nick, String taker_Nick, Date donate_date, int donate_amount) {
		super();
		this.donate_no = donate_no;
		this.giver_Nick = giver_Nick;
		this.taker_Nick = taker_Nick;
		this.donate_date = donate_date;
		this.donate_amount = donate_amount;
	}
	
	public Donate() {
		// TODO Auto-generated constructor stub
	}
	
}

package com.kh.forest.common;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Donate {
	private int donate_no;
	private int giver_no;
	private int taker_no;
	private Date donate_date;
	private int donate_amount;
	
	public Donate() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Donate [donate_no=" + donate_no + ", giver_no=" + giver_no + ", taker_no=" + taker_no + ", donate_date="
				+ donate_date + ", donate_amount=" + donate_amount + "]";
	}

	public Donate(int donate_no, int giver_no, int taker_no, Date donate_date, int donate_amount) {
		this.donate_no = donate_no;
		this.giver_no = giver_no;
		this.taker_no = taker_no;
		this.donate_date = donate_date;
		this.donate_amount = donate_amount;
	}

	public int getDonate_no() {
		return donate_no;
	}

	public void setDonate_no(int donate_no) {
		this.donate_no = donate_no;
	}

	public int getGiver_no() {
		return giver_no;
	}

	public void setGiver_no(int giver_no) {
		this.giver_no = giver_no;
	}

	public int getTaker_no() {
		return taker_no;
	}

	public void setTaker_no(int taker_no) {
		this.taker_no = taker_no;
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
	
	
}

package com.kh.forest.manager.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Refund {
	private int rownum;
	private String user_name;
	private String refund_amount;
	private String refund_tax;
	private String status;

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

	public String getRefund_amount() {
		return refund_amount;
	}

	public void setRefund_amount(String refund_amount) {
		this.refund_amount = refund_amount;
	}

	public String getRefund_tax() {
		return refund_tax;
	}

	public void setRefund_tax(String refund_tax) {
		this.refund_tax = refund_tax;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Refund(int rownum, String user_name, String refund_amount, String refund_tax, String status) {
		this.rownum = rownum;
		this.user_name = user_name;
		this.refund_amount = refund_amount;
		this.refund_tax = refund_tax;
		this.status = status;
	}

	public Refund() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Refund [rownum=" + rownum + ", user_name=" + user_name + ", refund_amount=" + refund_amount
				+ ", refund_tax=" + refund_tax + ", status=" + status + "]";
	}

}

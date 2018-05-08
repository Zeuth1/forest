package com.kh.forest.setting.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Pay {


	private String payNo;
	private int comNo;
	private int userNo;
	private int pay;
	private int tax;
	
	public Pay(){}

	public Pay(String payNo, int comNo, int userNo, int pay, int tax) {
		super();
		this.payNo = payNo;
		this.comNo = comNo;
		this.userNo = userNo;
		this.pay = pay;
		this.tax = tax;
	}

	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", comNo=" + comNo + ", userNo=" + userNo + ", pay=" + pay + ", tax=" + tax
				+ "]";
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}
	
}

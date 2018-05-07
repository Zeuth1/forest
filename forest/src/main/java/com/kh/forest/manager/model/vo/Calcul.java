package com.kh.forest.manager.model.vo;

public class Calcul {
	private String ym;
	private int amount;
	private int refund;
	private int tax;
	public String getym() {
		return ym;
	}
	public void setym(String ym) {
		this.ym = ym;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	@Override
	public String toString() {
		return "Calcul [ym=" + ym + ", amount=" + amount + ", refund=" + refund + ", tax=" + tax + "]";
	}
	public Calcul(String ym, int amount, int refund, int tax) {
		super();
		this.ym = ym;
		this.amount = amount;
		this.refund = refund;
		this.tax = tax;
	}
	
	public Calcul() {
		// TODO Auto-generated constructor stub
	}
}

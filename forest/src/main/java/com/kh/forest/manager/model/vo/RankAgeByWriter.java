package com.kh.forest.manager.model.vo;

import org.springframework.stereotype.Component;

@Component
public class RankAgeByWriter {
	private int rankId;
	private int amount;
	private int count;
	private String writer;
	public int getRankId() {
		return rankId;
	}
	public void setRankId(int rankId) {
		this.rankId = rankId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "RankAgeByWriter [rankId=" + rankId + ", amount=" + amount + ", count=" + count + ", writer=" + writer
				+ "]";
	}
	public RankAgeByWriter(int rankId, int amount, int count, String writer) {
		super();
		this.rankId = rankId;
		this.amount = amount;
		this.count = count;
		this.writer = writer;
	}

	public RankAgeByWriter() {
		// TODO Auto-generated constructor stub
	}
}

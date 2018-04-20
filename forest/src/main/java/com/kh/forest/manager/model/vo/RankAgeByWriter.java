package com.kh.forest.manager.model.vo;

public class RankAgeByWriter {
	private int count;
	private String writer;

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
		return "RankAgeByWriter [count=" + count + ", writer=" + writer + "]";
	}

	public RankAgeByWriter(int count, String writer) {
		super();
		this.count = count;
		this.writer = writer;
	}

	public RankAgeByWriter() {
		// TODO Auto-generated constructor stub
	}
}

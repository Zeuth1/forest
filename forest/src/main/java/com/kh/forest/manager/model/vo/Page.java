package com.kh.forest.manager.model.vo;

public class Page {
	private int page;
	private int count;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Page [page=" + page + ", count=" + count + "]";
	}

	public Page(int page, int count) {
		this.page = page;
		this.count = count;
	}

	public Page() {
		// TODO Auto-generated constructor stub
	}
}

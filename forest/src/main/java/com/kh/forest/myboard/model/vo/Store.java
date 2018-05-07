package com.kh.forest.myboard.model.vo;

public class Store {
	private String Store_No;	//저장기록번호
	private String Tree_No;		//트리번호
	private String BoardNo;	//보드번호
	
	public Store(){
		
	}

	public Store(String store_No, String tree_No, String boardNo) {
		super();
		Store_No = store_No;
		Tree_No = tree_No;
		BoardNo = boardNo;
	}

	public String getStore_No() {
		return Store_No;
	}

	public void setStore_No(String store_No) {
		Store_No = store_No;
	}

	public String getTree_No() {
		return Tree_No;
	}

	public void setTree_No(String tree_No) {
		Tree_No = tree_No;
	}

	public String getBoardNo() {
		return BoardNo;
	}

	public void setBoardNo(String boardNo) {
		BoardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Store [Store_No=" + Store_No + ", Tree_No=" + Tree_No + ", BoardNo=" + BoardNo + "]";
	}
	
	
	
	
}

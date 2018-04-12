package com.kh.forest.main.model.vo;

public class Tree implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2676807028173003107L;
	
	private String treeNo;
	private String treeAfter;
	private String treeTag;
	
	public Tree(){}
	
	public Tree(String treeNo, String treeAfter, String treeTag) {
		super();
		this.treeNo = treeNo;
		this.treeAfter = treeAfter;
		this.treeTag = treeTag;
	}
	
	public String getTreeNo() {
		return treeNo;
	}
	public void setTreeNo(String treeNo) {
		this.treeNo = treeNo;
	}
	public String getTreeAfter() {
		return treeAfter;
	}
	public void setTreeAfter(String treeAfter) {
		this.treeAfter = treeAfter;
	}
	public String getTreeTag() {
		return treeTag;
	}
	public void setTreeTag(String treeTag) {
		this.treeTag = treeTag;
	}
	
	@Override
	public String toString() {
		return "Tree [treeNo=" + treeNo + ", treeAfter=" + treeAfter + ", treeTag=" + treeTag + "]";
	}
	
	
}

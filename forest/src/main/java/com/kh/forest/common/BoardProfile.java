package com.kh.forest.common;

public class BoardProfile {
	
	private String userNo;
	private String userNickName;
	private String userIntroduce;
	private String userProfile;
	
	
	
	
	@Override
	public String toString() {
		return "BoardProfile [userNo=" + userNo + ", userNickName=" + userNickName + ", userIntroduce=" + userIntroduce
				+ ", userProfile=" + userProfile + "]";
	}
	
	public BoardProfile(){}
	
	public BoardProfile(String userNo, String userNickName, String userIntroduce, String userProfile) {
		super();
		this.userNo = userNo;
		this.userNickName = userNickName;
		this.userIntroduce = userIntroduce;
		this.userProfile = userProfile;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserIntroduce() {
		return userIntroduce;
	}
	public void setUserIntroduce(String userIntroduce) {
		this.userIntroduce = userIntroduce;
	}
	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
	
	

}

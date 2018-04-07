package com.kh.forest.common;

public class Member {
	
	
	public Member(){}
	public Member(int mNo, String mId, String mPwd, String mName, String mBirth, String mGender, String mPhone,
			String mEmail, String mStatus, String mLevel) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mBirth = mBirth;
		this.mGender = mGender;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mStatus = mStatus;
		this.mLevel = mLevel;
	}
	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + ", mBirth=" + mBirth
				+ ", mGender=" + mGender + ", mPhone=" + mPhone + ", mEmail=" + mEmail + ", mStatus=" + mStatus
				+ ", mLevel=" + mLevel + "]";
	}
	private int mNo;
	private String mId;
	private String mPwd;
	private String mName;
	private String mBirth;
	private String mGender;
	private String mPhone;
	private String mEmail;
	private String mStatus;
	private String mLevel;
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmStatus() {
		return mStatus;
	}
	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}
	public String getmLevel() {
		return mLevel;
	}
	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
	}
	
	
	
	
}

package com.kh.forest.login.model.dao;

import com.kh.forest.common.Member;

public interface LoginDao {

	String getaName();

	int getCheckNum(Member m);

	void insertMember(Member m);

	int checkMember(String mId, String mPwd);

	int checkPhone(String id);

	void changePwd(Member m);

	int compareId(String userId);

	Member sessionMaker(String mId);

	Member sessionMaker2(String userId);

	int checkMail(String email);

	
	

}

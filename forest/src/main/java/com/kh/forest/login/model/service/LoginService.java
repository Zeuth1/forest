package com.kh.forest.login.model.service;

import com.kh.forest.common.Member;

public interface LoginService {

	String getaName();

	int getCheck(Member m);

	void insertMember(Member m);

	int checkMember(String mId, String mPwd);

	int checkPhone(String id);

	void changePwd(Member m);

	Member sessionMaker(String mId);
	
	
	
	
	
}

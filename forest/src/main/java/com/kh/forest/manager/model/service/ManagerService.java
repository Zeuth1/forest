package com.kh.forest.manager.model.service;

import java.util.ArrayList;

import com.kh.forest.common.Member;
import com.kh.forest.manager.model.vo.RankGender;

public interface ManagerService {

	ArrayList<Member> memberSerchAll();

	ArrayList<Member> memberSerchOne(String searchval, String searchcon);

	int[] chartGenderNum();

	ArrayList<RankGender> rank3byGenderMale();

	ArrayList<RankGender> rank3byGenderFemale();

	int[] chartAgeNum();

	void memberUpdate(int mNo, String mPwd, String mPhone, String mEmail, String mLevel, String mNickName);



}

package com.kh.forest.setting.model.dao;

import java.util.List;

import com.kh.forest.common.Donate;
import com.kh.forest.common.Member;
import com.kh.forest.common.Tree;
import com.kh.forest.main.model.vo.History;
import com.kh.forest.setting.model.vo.Notice2;
import com.kh.forest.setting.model.vo.Pay;

public interface SettingDao {

	void changePwd(Member m);

	void deleteSearch(History his);

	void setProfilePhoto(Tree tree);

	String getProfilePhoto(int tree);

	
	void setProfileEtc(Member m, Notice2 notice);

	String getIntroduce(int getmNo);

	void payment(Pay pay, Donate donate);

	List<Donate> getDonate(int getmNo);

	List<Donate> getTakeMoney(int getmNo);

	List<Notice2> getAr(int getmNo);

	Member getInt(String userNick);

	void setArm(Notice2 notice);

	

}

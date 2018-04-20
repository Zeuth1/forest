package com.kh.forest.manager.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forest.common.Member;
import com.kh.forest.manager.model.vo.RankGender;

public interface ManagerDao {

	ArrayList<Member> memberSerchAll(SqlSessionTemplate sqlsession);

	ArrayList<Member> memberSerchOne(SqlSessionTemplate sqlsession, String searchval, String searchcon);

	int[] chartGenderNum(SqlSessionTemplate sqlsession);

	ArrayList<RankGender> rank3byGenderMale(SqlSessionTemplate sqlsession);

	ArrayList<RankGender> rank3byGenderFemale(SqlSessionTemplate sqlsession);

	int[] chartAgeNum(SqlSessionTemplate sqlsession);

	void memberUpdate(SqlSessionTemplate sqlsession, int mNo, String mPwd, String mPhone, String mEmail, String mLevel,
			String mNickName);

}

package com.kh.forest.manager.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forest.common.Member;
import com.kh.forest.manager.model.dao.ManagerDao;
import com.kh.forest.manager.model.vo.RankGender;
@Service
public class ManagerServiceImpl implements ManagerService {
@Autowired
private SqlSessionTemplate sqlsession;
@Autowired
private ManagerDao md;

	@Override
	public ArrayList<Member> memberSerchAll() {
		// TODO Auto-generated method stub
		ArrayList<Member>list=md.memberSerchAll(sqlsession);
		return list;
	}
	@Override
	public ArrayList<Member> memberSerchOne(String searchval, String searchcon) {
		// TODO Auto-generated method stub
		ArrayList<Member>list=md.memberSerchOne(sqlsession,searchval,searchcon);
		return list;
	}
	@Override
	public int[] chartGenderNum() {
		// TODO Auto-generated method stub
		int[] gender=new int[2];
		gender = md.chartGenderNum(sqlsession);
		return gender;
	}
	@Override
	public ArrayList<RankGender> rank3byGenderMale() {
		// TODO Auto-generated method stub
		ArrayList<RankGender>list=md.rank3byGenderMale(sqlsession);
		return list;
	}
	@Override
	public ArrayList<RankGender> rank3byGenderFemale() {
		// TODO Auto-generated method stub
		ArrayList<RankGender>list=md.rank3byGenderFemale(sqlsession);
		return list;
	}
	@Override
	public int[] chartAgeNum() {
		// TODO Auto-generated method stub
		int[] age=new int[6];
		age = md.chartAgeNum(sqlsession);
		return age;
	}
	@Override
	public void memberUpdate(int mNo,String mPwd, String mPhone, String mEmail, String mLevel, String mNickName) {
		// TODO Auto-generated method stub
		md.memberUpdate(sqlsession,mNo,mPwd,mPhone,mEmail,mLevel,mNickName);
	}
	
	


}

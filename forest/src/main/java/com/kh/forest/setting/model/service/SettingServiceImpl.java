package com.kh.forest.setting.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forest.common.Donate;
import com.kh.forest.common.Member;
import com.kh.forest.common.Tree;
import com.kh.forest.main.model.vo.History;
import com.kh.forest.setting.model.dao.SettingDao;
import com.kh.forest.setting.model.vo.Notice2;
import com.kh.forest.setting.model.vo.Pay;

@Service
public class SettingServiceImpl implements SettingService{

	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	SettingDao sd;
	@Autowired
	History his;
	@Override
	public void changePwd(Member m) {

		sd.changePwd(m);
		
	}
	@Override
	public void deleteSearch(History his) {

		sd.deleteSearch(his);
		
	}
	@Override
	public void setProfilePhoto(Tree tree) {
		sd.setProfilePhoto(tree);
		
	}
	@Override 
	public String getProfile(int tree) {
		// TODO Auto-generated method stub
		String profile=sd.getProfilePhoto(tree);
		return profile;
	}
	@Override
	public void setprofileEtc(Member m, Notice2 notice) {
		sd.setProfileEtc(m,notice);
		
	}
	@Override
	public String getIntroduce(int getmNo) {

		String Introduce=sd.getIntroduce(getmNo);
		return Introduce;
	}
	@Override
	public void payment(Pay pay, Donate donate) {
		
		sd.payment(pay,donate);
		
	}
	@Override
	public List<Donate> getDonate(int getmNo) {
		List<Donate> donate=sd.getDonate(getmNo);
		return donate;
	}
	@Override
	public List<Donate> getTakeMoney(int getmNo) {
		List<Donate> donate=sd.getTakeMoney(getmNo);
		return donate;
	}
	@Override
	public List<Notice2> getar(int getmNo) {
	
		List<Notice2> getar=sd.getAr(getmNo);
		
		return getar;
	}



}

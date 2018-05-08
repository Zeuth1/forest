package com.kh.forest.setting.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.forest.common.Donate;
import com.kh.forest.common.Member;
import com.kh.forest.common.Tree;
import com.kh.forest.main.model.vo.History;
import com.kh.forest.setting.model.vo.Notice2;
import com.kh.forest.setting.model.vo.Pay;

@Repository
public class SettingDaoImpl implements SettingDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	History his;
	
	@Override
	public void changePwd(Member m) {
		
		
		sqlSession.update("Member.changePwd",m);
		
		
		
	}

	@Override
	public void deleteSearch(History his) {

		sqlSession.delete("History.deleteSearch",his);
		
	}

	@Override
	public void setProfilePhoto(Tree tree) {
		sqlSession.insert("Tree.insertProfilePhoto",tree);
		
	}

	@Override
	public String getProfilePhoto(int tree) {
		String profile=sqlSession.selectOne("Tree.getProfilePhoto", tree);
		return profile;
	}


	@Override
	public void setProfileEtc(Member m, Notice2 notice) {

		sqlSession.insert("Notice2.setIntroduce",notice);
		sqlSession.update("Member.changeEtc",m);
		
	}

	@Override
	public String getIntroduce(int getmNo) {
		String introduce=sqlSession.selectOne("Notice2.getIntroduce",String.valueOf(getmNo));
		return introduce;
	}

	@Override
	public void payment(Pay pay, Donate donate) {
		sqlSession.insert("Donate.insertPayment",donate);
		sqlSession.insert("Pay.insertPayment",pay);
		
	}

	@Override
	public List<Donate> getDonate(int getmNo) {
		List<Donate> donate=sqlSession.selectList("Donate.getDonate", getmNo);
		
		for(int i=0 ; i<donate.size();i++){
			donate.get(i).setGiver_no(sqlSession.selectOne("Member.findDonater",donate.get(i).getGiver_no()));
			donate.get(i).setTaker_no(sqlSession.selectOne("Member.findTaker",donate.get(i).getTaker_no()));
		}
			
		return donate;
	}

	@Override
	public List<Donate> getTakeMoney(int getmNo) {
		List<Donate> donate=sqlSession.selectList("Donate.getTakeMoney", getmNo);
		
		for(int i=0 ; i<donate.size();i++){
			
			donate.get(i).setGiver_no(sqlSession.selectOne("Member.findDonater",donate.get(i).getGiver_no()));
			donate.get(i).setTaker_no(sqlSession.selectOne("Member.findTaker",donate.get(i).getTaker_no()));
		}
		
		
		return donate;
	}

	@Override
	public List<Notice2> getAr(int getmNo) {
		System.out.println(getmNo);
		List<Notice2> getar=sqlSession.selectList("Notice2.getAr",getmNo);
		
		return getar;
	}


}

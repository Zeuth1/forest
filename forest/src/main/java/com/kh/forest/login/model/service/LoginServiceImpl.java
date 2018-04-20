package com.kh.forest.login.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forest.common.Member;
import com.kh.forest.login.model.dao.LoginDao;


@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	LoginDao ld;
	
	
	@Override
	public String getaName() {
		
		
		String aName=ld.getaName();
		
		return aName;
	}


	@Override
	public int getCheck(Member m) {

		int checkNum=ld.getCheckNum(m);
		
		
		return checkNum;
	}


	@Override
	public void insertMember(Member m) {

	   ld.insertMember(m);
		
		
	}


	@Override
	public int checkMember(String mId, String mPwd) {
			
		int result=ld.checkMember(mId,mPwd);

		return result;
	}


	@Override
	public int checkPhone(String id) {
		
		int check=ld.checkPhone(id);
		
		
		return check;
	}


	@Override
	public void changePwd(Member m) {

		ld.changePwd(m);
		
		
	}


	@Override
	public Member sessionMaker(String mId) {
		
		Member m = ld.sessionMaker(mId);
		
		return m;
	}
	
	


	

}

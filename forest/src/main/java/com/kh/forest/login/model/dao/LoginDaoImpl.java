package com.kh.forest.login.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.forest.common.Member;


@Repository
public class LoginDaoImpl implements LoginDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@Override
	public String getaName() {
			
		String aName=sqlSession.selectOne("Tree.selectPic");	
		return aName;
	}

	@Override
	public int getCheckNum(Member m) {
		
		String nick=m.getmNickName();
		
		int checkNum=sqlSession.selectOne("Member.checkNick",m.getmNickName());
		
		return checkNum;
	}

	@Override
	public void insertMember(Member m) {
		System.out.println("m?:"+m);
		sqlSession.insert("Member.insertMember",m);
		
	}

	@Override
	public int checkMember(String mId, String mPwd) {

		int id=sqlSession.selectOne("Member.checkId", mId);
		int result=0;
		
		String cryptPwd=sqlSession.selectOne("Member.checkPwd",mId);
		
		if(!passwordEncoder.matches(mPwd, cryptPwd)) result++;
		if(id==0) result++;

		return result;
	}

	@Override
	public int checkPhone(String id) {
		
		int check=sqlSession.selectOne("Member.checkId",id);
		
		
		return check;
	}

	@Override
	public void changePwd(Member m) {
			
		
		String cryptPwd=sqlSession.selectOne("Member.checkPwd",m.getmId());
		
			
		sqlSession.update("Member.changePwd",m);
			
		
		

	
	}

	@Override
	public int compareId(String socialId) {
		
		System.out.println(socialId);
		
		int check=sqlSession.selectOne("Member.CheckSocial",socialId);
		
		return check;
	}

	@Override
	public Member sessionMaker(String mId) {
		
		Member m = sqlSession.selectOne("Member.sessionMember", mId);
	       return m;
	}

	@Override
	public Member sessionMaker2(String userId) {

		Member m = sqlSession.selectOne("Member.sessionMember2",userId);
		
		return m;
	}

	@Override
	public int checkMail(String email) {

		int result= sqlSession.selectOne("Member.checkMail",email);

		return result;
	}

	

	

}

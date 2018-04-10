package com.kh.forest.main.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainBoardDaoImpl implements MainBoardDao{
	
	@Autowired 
	private SqlSessionTemplate sqlSessison;

	@Override
	public void test(SqlSessionTemplate sqlSession) {
		String user = sqlSessison.selectOne("Mainboard.test");
		System.out.println(user);
		
	}
	
	
}

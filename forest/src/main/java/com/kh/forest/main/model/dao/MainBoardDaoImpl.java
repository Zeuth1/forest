package com.kh.forest.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainBoardDaoImpl implements MainBoardDao{
	
	@Autowired 
	private SqlSessionTemplate sqlSessison;

	@Override
	public ArrayList test(SqlSessionTemplate sqlSession) {
		ArrayList treeList = (ArrayList)sqlSessison.selectList("Mainboard.test");
		
		return treeList;
		
	}
	
	
}

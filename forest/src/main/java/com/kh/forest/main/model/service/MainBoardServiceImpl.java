package com.kh.forest.main.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forest.main.model.dao.MainBoardDao;

@Service
public class MainBoardServiceImpl implements MainBoardService{
	
	@Autowired
	private MainBoardDao md;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void test() {
		// TODO Auto-generated method stub
		md.test(sqlSession);
	}
	
	
}

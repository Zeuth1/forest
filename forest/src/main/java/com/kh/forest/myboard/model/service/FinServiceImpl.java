package com.kh.forest.myboard.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forest.myboard.model.dao.FinDao;
import com.kh.forest.myboard.model.vo.Fin;

@Service
public class FinServiceImpl implements FinService{
	@Autowired
	private FinDao md;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public void insertFin(Fin f) {
		
		int result = md.insertFin(sqlSession, f);
		
	}
	
	
	
}

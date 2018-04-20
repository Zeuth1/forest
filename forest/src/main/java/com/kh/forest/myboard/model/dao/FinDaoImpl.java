package com.kh.forest.myboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.forest.myboard.model.vo.Fin;

@Repository
public class FinDaoImpl implements FinDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertFin(SqlSessionTemplate sqlSession, Fin f){
		
		return sqlSession.insert("Fin.inserFin",f);
	}
	
	
	
}

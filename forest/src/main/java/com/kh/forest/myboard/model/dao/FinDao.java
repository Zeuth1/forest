package com.kh.forest.myboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forest.myboard.model.vo.Fin;

public interface FinDao {
	
	int insertFin(SqlSessionTemplate sqlSession, Fin f);
	
}

package com.kh.forest.main.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forest.main.model.vo.Tree;

public interface MainBoardDao {
	public ArrayList test(SqlSessionTemplate sqlSession);
	
	public List<Tree> paging(SqlSessionTemplate sqlSession, List<String> treeArr);
	
}

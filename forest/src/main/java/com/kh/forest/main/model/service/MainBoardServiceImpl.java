package com.kh.forest.main.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forest.main.model.dao.MainBoardDao;
import com.kh.forest.main.model.vo.Tree;

@Service
public class MainBoardServiceImpl implements MainBoardService{
	
	@Autowired
	private MainBoardDao md;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList test() {
		// TODO Auto-generated method stub
		return md.test(sqlSession);
	}

	@Override
	public List<Tree> paging(List<String> treeArr) {
		
		List<Tree> treeList = md.paging(sqlSession, treeArr);
	
		return treeList;
	}
	
	
	
}

package com.kh.forest.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forest.main.model.dao.MainBoardDao;
import com.kh.forest.main.model.vo.Detail;
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

	@Override
	public Detail detail(String treeNo) {
		
		
		Detail detail = md.detail(sqlSession, treeNo);
		
		return detail;
	}

	@Override
	public HashMap<String, String> observe(String searchWord) {
		HashMap<String, String> observeResultList = md.observe(sqlSession, searchWord);
		
		return observeResultList;
	}

	@Override
	public ArrayList<Tree> search(String item, int mno) {
		ArrayList<Tree> searchResultList = md.search(sqlSession, item, mno);
		
		return searchResultList;
	}

	@Override
	public ArrayList<String> history(int mno) {
		ArrayList<String> historyList = md.history(sqlSession, mno);
		
		
		return historyList;
	}
	
	
	
}

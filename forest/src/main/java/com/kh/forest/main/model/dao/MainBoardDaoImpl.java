package com.kh.forest.main.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.forest.main.model.vo.Detail;
import com.kh.forest.main.model.vo.Tree;

@Repository
public class MainBoardDaoImpl implements MainBoardDao{
	
	@Autowired 
	private SqlSessionTemplate sqlSessison;

	@Override
	public ArrayList test(SqlSessionTemplate sqlSession) {
		ArrayList treeList = (ArrayList)sqlSessison.selectList("Mainboard.test");
		
		return treeList;
		
	}

	@Override
	public List<Tree> paging(SqlSessionTemplate sqlSession, List<String> treeArr) {
		
		List<Tree> treeList = (List)sqlSession.selectList("Mainboard.paging", treeArr);
		
		return treeList;
	}

	@Override
	public Detail detail(SqlSessionTemplate sqlSession, String treeNo) {
		
		Detail detail = (Detail)sqlSession.selectOne("Mainboard.detail", treeNo);
		
		System.out.println(detail);
		
		return detail;
	}
	
	
}

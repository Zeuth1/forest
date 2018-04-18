package com.kh.forest.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

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

	@Override
	public HashMap<String, String> observe(SqlSessionTemplate sqlSession, String searchWord) {
		
		List<String> searchResultList =  (List)sqlSession.selectList("Mainboard.search", searchWord);
		ArrayList<String> observeList = new ArrayList<String>();
		
		TreeSet<String> setter = new TreeSet<String>();
		
		HashMap<String, String> observeResultList = new HashMap<String, String>();
		
		for(String searchResult : searchResultList){
			if(searchResult.contains("#" + searchWord)){
			
			String[] splinter = searchResult.split("#");
			
				for(String splited : splinter){
					if(splited.contains(searchWord)){
					setter.add("#" + splited);
					}
				}
			
			
			}
		}
		
		for(String splited : setter){
			System.out.println(splited);
			observeList.add(splited);
		}
		
		for(String observeResult : observeList){
			int num = 0;
			for(String searchResult : searchResultList){
				if( (searchResult + "#").contains(observeResult + "#") ){
					num++;
				}
			}
			observeResultList.put(observeResult, num + "");
			
		}
		
		return observeResultList;
		
		
	}
	
	
}

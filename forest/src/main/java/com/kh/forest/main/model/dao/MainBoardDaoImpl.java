package com.kh.forest.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.naming.ldap.SortKey;

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
		//검색어로 시작하는 단어가 포함된 트리태그들을 모두 저장 
		
		ArrayList<String> observeList = new ArrayList<String>();
		
		TreeSet<String> setter = new TreeSet<String>();
		
		HashMap<String, String> observeResultList = new HashMap<String, String>();
		
		
		for(String searchResult : searchResultList){
			//트리태그들을 개별분리
			
			String[] splinter = searchResult.split("#");
			//개별트리태그를 #단위로 분리
				for(String splited : splinter){
					//#태그가 검색어로 시작하는 단어일 경우 set에 저장
					if(("#" + splited).contains("#" + searchWord)){
					setter.add("#" + splited);
					}
				}
			
			
			
		}
		
		for(String splited : setter){
			//set에서 중복 검사 후 list에 다시 주입
			System.out.println(splited);
			observeList.add(splited);
		}
		
		for(String observeResult : observeList){
			//검색결과수 추출
			int num = 0;
			for(String searchResult : searchResultList){
				if( (searchResult + "#").contains(observeResult + "#") ){
					//#포함된 트리태그 중 정확한 #태그가 포함된 트리태그 추출 
					num++;
				}
			}
			observeResultList.put(observeResult, num + "");
			//map형태에 검색어/검색결과수 형태로 저장 
			
		}
		
		sortByValue(observeResultList)
		
		return observeResultList;
		
		
	}
	
	
}

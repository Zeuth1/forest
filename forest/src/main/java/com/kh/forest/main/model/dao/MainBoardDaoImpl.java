package com.kh.forest.main.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.naming.ldap.SortKey;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.forest.common.Commentary;
import com.kh.forest.common.CommentaryModel;
import com.kh.forest.main.model.vo.Detail;
import com.kh.forest.main.model.vo.History;
import com.kh.forest.main.model.vo.SortByValue;
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
		
		return detail;
	}

	@Override
	public HashMap<String, String> observe(SqlSessionTemplate sqlSession, String searchWord) {
		
		List<String> searchResultList =  (List)sqlSession.selectList("Mainboard.observe", searchWord);
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
		
		//map을 value에 대해서 내림차순 정렬
		SortByValue sort = new SortByValue();
		
	    Iterator it = sort.sortByValue(observeResultList).iterator();
	    
	    LinkedHashMap<String, String> observeSortResultList = new LinkedHashMap<String, String>();
	    
	    while(it.hasNext()){
	    	String key = (String)it.next();
	    	String value = (String)observeResultList.get(key);
	    	
	    	observeSortResultList.put(key, value);
	    }
		
		return observeSortResultList;
		
		
	}

	@Override
	public ArrayList<Tree> search(SqlSessionTemplate sqlSession, String item, int mno){ 
		
		
		History history = new History();
		ArrayList<Tree> searchResultListAfter = null;
		ArrayList<Tree> searchResultListBefore = null;
		
		history.setMno(mno + "");
		history.setItem(item);
		
		try{
			sqlSession.insert("Mainboard.historyInsert", history);
		}finally{
			
			searchResultListBefore = (ArrayList)sqlSession.selectList("Mainboard.search", "#" + item);
			
			searchResultListAfter = new ArrayList<Tree>();
			
			for(Tree tree : searchResultListBefore){
				if( (tree.getTreeTag() + "#").contains("#" + item + "#") ){
					searchResultListAfter.add(tree);
				}
				
			}
			
			return searchResultListAfter;
		}
		
		
		
	}

	@Override
	public ArrayList<String> history(SqlSessionTemplate sqlSession, int mno) {
		ArrayList<String> historyList = (ArrayList)sqlSession.selectList("Mainboard.history", mno + "");
		
		
		
		return historyList;
	}

	@Override
	public ArrayList<Commentary> commentaryList(SqlSessionTemplate sqlSession, String treeNo, String commentCount) {
		HashMap<String, String> hash = new HashMap<String, String>();
		
		hash.put("treeNo", treeNo);
		hash.put("commentCountStart", Integer.parseInt(commentCount) + 1 + "");
		hash.put("commentCountEnd", Integer.parseInt(commentCount) + 20 + "");
		
		ArrayList<Commentary> commentaryList = (ArrayList)sqlSession.selectList("Mainboard.commentaryList", hash);
		
		return commentaryList;
	}

	@Override
	public String getProfile(SqlSessionTemplate sqlSession, String mno) {
		String profile = sqlSession.selectOne("Mainboard.getProfile", mno);
		
		return profile;
	}

	@Override
	public void commentaryInsert(SqlSessionTemplate sqlSession, CommentaryModel model) throws Exception{
		int cno = sqlSession.insert("Mainboard.commentaryInsert", model);
		
		System.out.println(cno);
	}
	
	@Override
	public String insertedComment(SqlSessionTemplate sqlSession, String userNo) {
		String commentNo = sqlSession.selectOne("Mainboard.insertedComment", userNo);
		
		return commentNo;
	}

	@Override
	public int commentaryListCount(SqlSessionTemplate sqlSession, String treeNo) {
		int commentaryListCount = sqlSession.selectOne("Mainboard.commentaryListCount", treeNo);
		
		
		return commentaryListCount;
	}

	
	
}

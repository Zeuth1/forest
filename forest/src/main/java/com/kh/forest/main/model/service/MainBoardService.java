package com.kh.forest.main.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.forest.common.Commentary;
import com.kh.forest.common.CommentaryModel;
import com.kh.forest.main.model.vo.Detail;
import com.kh.forest.main.model.vo.Tree;

public interface MainBoardService {
	public ArrayList test();
	
	public List<Tree> paging(List<String> treeArr);
	
	public Detail detail(String treeNo);
	
	public HashMap<String, String> observe(String searchWord);
	
	public ArrayList<Tree> search(String item, int mno);
	
	public ArrayList<String> history(int mno);
	
	public ArrayList<Commentary> commentaryList(String treeNo, String commentCount);
	
	public String getProfile(String mno);
	
	public String commentaryInsert(CommentaryModel model) throws Exception;
	
	public int commentaryListCount(String treeNo);
}

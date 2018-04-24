package com.kh.forest.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.forest.main.model.vo.Detail;
import com.kh.forest.main.model.vo.Tree;

public interface MainBoardService {
	public ArrayList test();
	
	public List<Tree> paging(List<String> treeArr);
	
	public Detail detail(String treeNo);
	
	public HashMap<String, String> observe(String searchWord);
	
	public ArrayList<Tree> search(String item);
}

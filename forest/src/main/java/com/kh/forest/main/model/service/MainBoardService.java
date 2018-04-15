package com.kh.forest.main.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.forest.main.model.vo.Tree;

public interface MainBoardService {
	public ArrayList test();
	
	public List<Tree> paging(List<String> treeArr);
}

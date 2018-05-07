package com.kh.forest.main.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forest.common.Commentary;
import com.kh.forest.common.CommentaryModel;
import com.kh.forest.main.model.vo.Detail;
import com.kh.forest.main.model.vo.Tree;

public interface MainBoardDao {
	public ArrayList test(SqlSessionTemplate sqlSession);
	
	public List<Tree> paging(SqlSessionTemplate sqlSession, List<String> treeArr);
	
	public Detail detail(SqlSessionTemplate sqlSession, String treeNo);
	
	public HashMap<String, String> observe(SqlSessionTemplate sqlSession, String searchWord);
	
	public ArrayList<Tree> search(SqlSessionTemplate sqlSession, String item, int mno);
	
	public ArrayList<String> history(SqlSessionTemplate sqlSession, int mno);
	
	public ArrayList<Commentary> commentaryList(SqlSessionTemplate sqlSession, String treeNo, String commentCount);
	
	public String getProfile(SqlSessionTemplate sqlSession, String mno);
	
	public void commentaryInsert(SqlSessionTemplate sqlSession, CommentaryModel model) throws Exception;
	
	public String insertedComment(SqlSessionTemplate sqlSession, String userNo);
	
	public int commentaryListCount(SqlSessionTemplate sqlSession, String treeNo);

	public ArrayList<Commentary> replyList(SqlSessionTemplate sqlSession, String treeNo, String commentNo);
	
	public String checkCommentOwner(SqlSessionTemplate sqlSession, String commentNo);

	public void deleteCommentary(SqlSessionTemplate sqlSession, String commentNo) throws Exception;
}

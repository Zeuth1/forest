package com.kh.forest.myboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.SynthesizedAnnotation;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.forest.common.BoardProfile;
import com.kh.forest.myboard.model.vo.Board;
import com.kh.forest.myboard.model.vo.Fin;
import com.kh.forest.myboard.model.vo.Store;

import net.sf.json.JSONObject;

@Repository
public class FinDaoImpl implements FinDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insertFin(SqlSessionTemplate sqlSession, Fin f) {
		
		return sqlSession.insert("Fin.insertFin",f);	//mapper네임스페이스 xx.xx , f , phto
	}
	@Override
	public int insertFin2(SqlSessionTemplate sqlSession, Store s) {
		
		
		return sqlSession.insert("Store.insertFin2",s);
	}

	@Override
	public ArrayList selectFin(SqlSessionTemplate sqlSession, String userNo) {
		
		ArrayList list = (ArrayList) sqlSession.selectList("Fin.selectFin", userNo);
		
		
		return list;
	}
	//인설트 보드!!
	@Override
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("Board.insertBoard",b);
	}

	@Override
	public ArrayList selectBoard(SqlSessionTemplate sqlSession, String userNo) {
	
		ArrayList list = (ArrayList) sqlSession.selectList("Board.selectBoard",userNo);
		
		return list;
	}
	
	@Override
	public BoardProfile boardProfileSelect(SqlSessionTemplate sqlSession, String userNo) {
		BoardProfile boardProfile = sqlSession.selectOne("Fin.boardProfileSelect", userNo);

		System.out.println(boardProfile);
		
		return boardProfile;
	}
	@Override
	public String tnoSelecter(SqlSessionTemplate sqlSession) {
	    String tno = sqlSession.selectOne("Fin.tnoSelecter");
		return tno;
	}
	@Override
	public ArrayList selectStore(SqlSessionTemplate sqlSession, String userNo) {
		ArrayList list = (ArrayList) sqlSession.selectList("Board.selectStore",userNo);
	
		
		return list;
	}
	



	
	
	
}

package com.kh.forest.myboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
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
		
		System.out.println(f);
		
		return sqlSession.insert("Fin.insertFin",f);	//mapper네임스페이스 xx.xx , f , phto
	}
	@Override
	public int insertFin2(SqlSessionTemplate sqlSession, Store s) {
		
		System.out.println("daofin2 스토어값:"+s);
		
		return sqlSession.insert("Store.insertFin2",s);
	}

	@Override
	public ArrayList selectFin(SqlSessionTemplate sqlSession, String userNo) {
		System.out.println("오나?:"+userNo);
		
		ArrayList list = (ArrayList) sqlSession.selectList("Fin.selectStore", userNo);
		
		System.out.println("dao셀렉트핀다불러와!:"+list);
		
		return list;
	}
	//인설트 보드!!
	@Override
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		System.out.println("인설트보드 dao!!:"+b);
		
		return sqlSession.insert("Board.insertBoard",b);
	}

	@Override
	public ArrayList selectBoard(SqlSessionTemplate sqlSession, String userNo) {
		System.out.println("셀렉트보드dao:"+userNo);
		ArrayList list = (ArrayList) sqlSession.selectList("Board.selectBoard",userNo);
		System.out.println("보드셀렉트dao리스트불러와~:"+list);
		return list;
	}
	@Override
	public BoardProfile boardProfileSelect(SqlSessionTemplate sqlSession, String userNo) {
		BoardProfile boardProfile = sqlSession.selectOne("Fin.boardProfileSelect", userNo);
		
		
		return boardProfile;
	}
	
	@Override
	public String boardProfileSelect2(SqlSessionTemplate sqlSession, String userNo) {
		String userIntroduce = sqlSession.selectOne("Fin.boardProfileSelect2", userNo);
		
		return userIntroduce;
	}
	

	

	
	
	
}

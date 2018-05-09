package com.kh.forest.myboard.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.kh.forest.common.BoardProfile;
import com.kh.forest.myboard.model.vo.Board;
import com.kh.forest.myboard.model.vo.Fin;
import com.kh.forest.myboard.model.vo.Store;

import net.sf.json.JSONObject;

public interface FinDao {

	int insertFin(SqlSessionTemplate sqlSession, Fin f);

	ArrayList selectFin(SqlSessionTemplate sqlSession, String userNo);

	int insertBoard(SqlSessionTemplate sqlSession, Board b);

	ArrayList selectBoard(SqlSessionTemplate sqlSession, String userNo);

	int insertFin2(SqlSessionTemplate sqlSession, Store s);

	public BoardProfile boardProfileSelect(SqlSessionTemplate sqlSession, String userNo);

	
}

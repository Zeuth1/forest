package com.kh.forest.myboard.model.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.forest.common.BoardProfile;
import com.kh.forest.myboard.model.dao.FinDao;
import com.kh.forest.myboard.model.vo.Board;
import com.kh.forest.myboard.model.vo.Fin;
import com.kh.forest.myboard.model.vo.Store;

import net.sf.json.JSONObject;

@Service
public class FinServiceImpl implements FinService{
	@Autowired
	private FinDao fd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public void insertFin(Fin f) {
		int result = fd.insertFin(sqlSession, f);
	}
	@Override
	public void insertFin2(Store s) {
		int result = fd.insertFin2(sqlSession,s);
	}

	@Override
	public ArrayList selectFin(String userNo) {
		ArrayList list = fd.selectFin(sqlSession,userNo);
		
		return list;
	}

	@Override
	public void insertBoard(Board b) {

		int result = fd.insertBoard(sqlSession,b);
		
	}

	@Override
	public ArrayList selectBoard(String userNo) {
		ArrayList list = fd.selectBoard(sqlSession,userNo);
		
		return list;
	}

	@Override
	public BoardProfile boardProfileSelect(String userNo) {
		BoardProfile boardProfile = fd.boardProfileSelect(sqlSession, userNo);
		
		
		return boardProfile;
	}
	@Override
	public String tnoSelecter() {
		String tno = fd.tnoSelecter(sqlSession);
		
		return tno;
	}


	
}

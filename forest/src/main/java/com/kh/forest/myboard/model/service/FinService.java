package com.kh.forest.myboard.model.service;

import java.util.ArrayList;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.forest.common.BoardProfile;
import com.kh.forest.myboard.model.vo.Board;
import com.kh.forest.myboard.model.vo.Fin;
import com.kh.forest.myboard.model.vo.Store;

import net.sf.json.JSONObject;

public interface FinService {

	void insertFin(Fin f);
	
	ArrayList selectFin(String userNo);

	void insertBoard(Board b);

	ArrayList selectBoard(String userNo);


	void insertFin2(Store s);

	public BoardProfile boardProfileSelect(String userNo);
	
	public String tnoSelecter();

	ArrayList selectStore(String userNo);

}

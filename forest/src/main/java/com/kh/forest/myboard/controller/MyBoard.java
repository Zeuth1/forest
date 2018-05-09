package com.kh.forest.myboard.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.forest.common.BoardProfile;
import com.kh.forest.common.Member;
import com.kh.forest.myboard.model.service.BoardService;
import com.kh.forest.myboard.model.service.FinService;
import com.kh.forest.myboard.model.vo.Board;
import com.kh.forest.myboard.model.vo.Fin;
import com.kh.forest.myboard.model.vo.Store;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@SessionAttributes("loginUser")
public class MyBoard {
	
	@Autowired
	private FinService fs;
	
	//마이보드로가기
	@RequestMapping(value="myBoard.my")
	public @ResponseBody ModelAndView myboard(ModelAndView mv, @RequestParam(value="mno")String userNo,
			@RequestParam(value="toMine", required=false)String toMine, @RequestParam(value="toStore", required=false)String toStore ){
		
		
		BoardProfile boardProfile = fs.boardProfileSelect(userNo);

		mv.addObject("ownerProfile", boardProfile);
		
		if(toStore != null){
			mv.setViewName("myStore");
		}else if(toMine != null){
			mv.setViewName("myboard");
		}else{
			mv.setViewName("myboard");
		}
		
		
		return mv;
	}
	//마이보드에서 보드만들기
	@RequestMapping(value="boardAddForm.my")
  public ModelAndView boardAddForm(ModelAndView mv){

		
		mv.setViewName("boardAddForm");
		
		return mv;
	}
	//마이보드에서 보드 클릭시 디테일 (핀보기) = 보드디테일
	@RequestMapping(value="myBoardDetail.my")
	public ModelAndView myBoardDetail(ModelAndView mv){
	
		mv.setViewName("myBoardDetail");
		
		return mv;
	}
	//마이보드에서 핀으로!
	@RequestMapping(value="myBoardFin.my")
	public ModelAndView myBoardFin(ModelAndView mv,String Board_No){
		
		Board b = new Board();
		b.setBoard_No(Board_No);
		
		mv.setViewName("myBoardFin");
		
		return mv;
	}
	//핀에서 핀추가하기폼!!!
	@RequestMapping(value="finAddForm.my")
	public ModelAndView finAddForm(ModelAndView mv){
		
		
		mv.setViewName("finAddForm");
		return mv;
	}
	
	//핀인설트+ 파일 업로드
	@RequestMapping(value="finAdd.my")
	public String finAdd(ModelAndView mv,@RequestParam(name="Tree_After",required=false)MultipartFile photo,HttpServletRequest request,
			String Tree_Tag, String Tree_Type, String User_No, String board){
		/*String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles";*/
		String filePath = "C:/Users/zeuth/forest/tree";
		
		Store s = new Store();
		Fin f = new Fin();
		
		System.out.println("추가");
		
		Date date =new Date();
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String str = dayTime.format(new Date(time));

		long start = System.currentTimeMillis(); 
		long end = System.currentTimeMillis(); 
		long Tree_After= end+start;
		String afterName2=String.valueOf(Tree_After);
		
		try {
			
			photo.transferTo(new File(filePath+"\\"+afterName2+photo.getOriginalFilename()));
			
		} catch (Exception e) {
			System.out.println("transferTo 실패!");
		}
		
		
		
		
		String Tree_No = fs.tnoSelecter();
		
		System.out.println(Tree_No);
		
		f.setTree_After(afterName2+photo.getOriginalFilename());	
		f.setTree_No(Tree_No);
		f.setTree_Tag(Tree_Tag);
		f.setTree_Before(photo.getOriginalFilename());
		f.setTree_Type(Tree_Type);
		f.setUser_No(User_No);
		
		s.setBoardNo(board);
		s.setTree_No(Tree_No);
		
	
		fs.insertFin(f);
		fs.insertFin2(s);
		
		
		return "redirect:/myBoardStore.my?board=" + board;
	}
	//마이보드핀 셀렉트!!
	@RequestMapping(value="myBoardFinSelect.my")
	public @ResponseBody String selectFin(ModelAndView mv,@RequestBody String board){
		JSONParser parser = new JSONParser();

		String userNo=null;
		try {
			 userNo = (String)parser.parse(board);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*Fin fin = new Fin();
		fin.setUser_No(userNo);
		System.out.println(fin);*/
		ArrayList list = fs.selectFin(userNo);
		
		System.out.println("핀 리스트 : " + list);
		
		JSONArray array = JSONArray.fromObject(list);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
			
		hashMap.put("board", array);
		JSONObject object = JSONObject.fromObject(hashMap);		
		
		return object.toString();
	}
	@RequestMapping(value="myBoardStore.my")
	public ModelAndView myBoardStore(ModelAndView mv, @RequestParam("board")String board, @RequestParam(value="ownerNo",required=false)String ownerNo){
		Store s = new Store();
		s.setBoardNo(board);
		mv.addObject("board", board);
		mv.addObject("ownerNo", ownerNo);
		mv.setViewName("myBoardFin");
		return mv;
	}
	
	//보드추가하기!!!!
	@RequestMapping(value="boardAdd.my")
	public String boardAdd(HttpServletRequest request,ModelAndView mv,String User_No,
			String Board_No, String Board_Type,String Board_Title){
		//BOARD_NO,USER_NO,BOARD_TYPE,BOARD_TITLE,BOARD_DATE
		//보드번호     ,보드소유번호, 보드타입       , 보드이름     , 보드생성일
		Board b = new Board();
		b.setUser_No(User_No);
		b.setBoard_No(Board_No);
		b.setBoard_Type(Board_Type);
		b.setBoard_Title(Board_Title);
		fs.insertBoard(b);
		
		return "redirect:/myBoard.my?mno=" + User_No;
	}
	//보드불러오기!!
	@RequestMapping(value="myBoardSelect.my")
	public @ResponseBody String selectBoard(@RequestBody String User_No){
		JSONParser parser = new JSONParser();
		String userNo = null;
		
		try {
			userNo = (String) parser.parse(User_No);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList list = fs.selectBoard(userNo);
		
		System.out.println(list);
		
		JSONArray array = JSONArray.fromObject(list);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		hashMap.put("userNo", array);
		JSONObject object = JSONObject.fromObject(hashMap);
		
		return object.toString();
	}
	
	//저장보드 불러오기!!
	@RequestMapping(value="myStoreSelect.my")
	public @ResponseBody String selectStore(@RequestBody String User_No){
		JSONParser parser = new JSONParser();
		String userNo = null;
		
		try {
			userNo = (String) parser.parse(User_No);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList list = fs.selectStore(userNo);
		
		System.out.println(list);
		
		JSONArray array = JSONArray.fromObject(list);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		hashMap.put("userNo", array);
		JSONObject object = JSONObject.fromObject(hashMap);
		
		return object.toString();
	}
	
	
}

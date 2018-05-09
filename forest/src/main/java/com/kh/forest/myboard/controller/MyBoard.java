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
	public @ResponseBody ModelAndView myboard(ModelAndView mv, @RequestParam(value="mno")String userNo ){
		
		System.out.println(userNo);
		
		
		BoardProfile boardProfile = fs.boardProfileSelect(userNo);
	
		System.out.println(boardProfile);
		
		mv.addObject("ownerProfile", boardProfile);
		
		mv.setViewName("myboard");
		
		return mv;
	}
	//마이보드에서 보드만들기
	@RequestMapping(value="boardAddForm.my")
	public ModelAndView boardAddForm(ModelAndView mv,HttpSession session){
		System.out.println("보드디테일!!!");
		Member m=(Member)session.getAttribute("loginUser");
		ArrayList<Board> b=fs.selectBoard(String.valueOf(m.getmNo()));
		System.out.println("boardAddform.my :b"+b);
		mv.addObject("board",b);
		
		mv.setViewName("boardAddForm");
		
		return mv;
	}
	//마이보드에서 보드 클릭시 디테일 (핀보기) = 보드디테일
	@RequestMapping(value="myBoardDetail.my")
	public ModelAndView myBoardDetail(ModelAndView mv){
		System.out.println("보드디테일!!!");
		mv.setViewName("myBoardDetail");
		
		return mv;
	}
	//마이보드에서 핀으로!
	@RequestMapping(value="myBoardFin.my")
	public ModelAndView myBoardFin(ModelAndView mv,String Board_No){
		System.out.println("핀으로!!");
		System.out.println("보드번호를찾아서:"+Board_No);
		Board b = new Board();
		b.setBoard_No(Board_No);
		System.out.println("보드번호를찾아서2:"+b);
		mv.setViewName("myBoardFin");
		
		return mv;
	}
	//핀에서 핀추가하기폼!!!
	@RequestMapping(value="finAddForm.my")
	public ModelAndView finAddForm(ModelAndView mv){
		System.out.println("핀만들기");
		
		
		mv.setViewName("finAddForm");
		return mv;
	}
	
	//핀인설트+ 파일 업로드
	@RequestMapping(value="finAdd.my")
	public String finAdd(ModelAndView mv,@RequestParam(name="Tree_After",required=false)MultipartFile photo,HttpServletRequest request,
			String Tree_Tag, String Tree_Type, String User_No, String board,String Tree_No){
		/*String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles";*/
		String filePath = "C:/Users/rnrgu/forest/tree";
		
		System.out.println("보드값no넘어오나?:"+board);
		Store s = new Store();
		s.setBoardNo(board);
		System.out.println("가자:"+s);
		
		Fin f = new Fin();
		
		Date date =new Date();
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String str = dayTime.format(new Date(time));
		System.out.println(str);
		long start = System.currentTimeMillis(); 
		long end = System.currentTimeMillis(); 
		long Tree_After= end+start;
		String afterName2=String.valueOf(Tree_After);
		
		//추가 부분
		f.setTree_After(afterName2+photo.getOriginalFilename());	
		f.setTree_Tag(Tree_Tag);
		f.setTree_No(Tree_No);
		f.setTree_Before(photo.getOriginalFilename());
		f.setTree_Type(Tree_Type);
		f.setUser_No(User_No);
		try {
			photo.transferTo(new File(filePath+"\\"+afterName2+photo.getOriginalFilename()));
			System.out.println("photo:"+photo);
			System.out.println("filepath:"+filePath);
			fs.insertFin(f);
			fs.insertFin2(s);
			
		} catch (IOException e) {
			
		}
		System.out.println("트리는?"+f);
		
		System.out.println("성공");
		
		
		return "redirect:/myBoardStore.my?board=" + board;
	}
	//마이보드핀 셀렉트!!
	@RequestMapping(value="myBoardFinSelect.my")
	public @ResponseBody String selectFin(ModelAndView mv,@RequestBody String board){
		JSONParser parser = new JSONParser();

		String userNo=null;
		try {
			 userNo = (String)parser.parse(board);
			 System.out.println("userNo1:"+userNo);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*Fin fin = new Fin();
		fin.setUser_No(userNo);
		System.out.println(fin);*/
		ArrayList list = fs.selectFin(userNo);
		JSONArray array = JSONArray.fromObject(list);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
			
		hashMap.put("board", array);
		JSONObject object = JSONObject.fromObject(hashMap);		
		
		return object.toString();
	}
	@RequestMapping(value="myBoardStore.my")
	public ModelAndView myBoardStore(ModelAndView mv, @RequestParam("board")String board){
		Store s = new Store();
		s.setBoardNo(board);
		System.out.println("스토어어어:"+s);
		
		mv.addObject("board", board);
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
		System.out.println(User_No);
		b.setUser_No(User_No);
		b.setBoard_No(Board_No);
		b.setBoard_Type(Board_Type);
		b.setBoard_Title(Board_Title);
		fs.insertBoard(b);
		System.out.println("컨트로올~:"+b);
		
		return "redirect:/myBoard.my";
	}
	//보드불러오기!!
	@RequestMapping(value="myBoardSelect.my")
	public @ResponseBody String selectBoard(@RequestBody String User_No){
		JSONParser parser = new JSONParser();
		String userNo = null;
		
		try {
			userNo = (String) parser.parse(User_No);
			System.out.println("userNo는?:"+userNo);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList list = fs.selectBoard(userNo);
		JSONArray array = JSONArray.fromObject(list);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		hashMap.put("userNo", array);
		JSONObject object = JSONObject.fromObject(hashMap);
		
		return object.toString();
	}
	
	
}

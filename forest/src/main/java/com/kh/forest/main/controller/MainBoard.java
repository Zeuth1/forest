package com.kh.forest.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUtils;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.forest.common.Commentary;
import com.kh.forest.common.CommentaryModel;
import com.kh.forest.common.Member;
import com.kh.forest.main.model.service.MainBoardService;
import com.kh.forest.main.model.vo.Detail;
import com.kh.forest.main.model.vo.Tree;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MainBoard {
	
	@Autowired
	private MainBoardService ms;
	
	@RequestMapping(value="mainBoard.ma", method=RequestMethod.GET)
	public ModelAndView mainBoard(ModelAndView mv){
		ArrayList treeList = ms.test();
		
		mv.addObject("treeList", treeList);
		mv.setViewName("mainBoard");
		return mv;
	}
	
	@RequestMapping(value="paging.ma", method=RequestMethod.POST)
	public @ResponseBody String paging(HttpServletResponse response, @RequestBody String JSONTreeArr_str){
		JSONParser jsonParser = new JSONParser();
		
		List<Tree> treeList = null;
		
		try {
			List<String> JSONTreeArr = (List<String>)jsonParser.parse(JSONTreeArr_str);
			
			treeList = ms.paging(JSONTreeArr);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
			
			
		JSONArray jsonArray = JSONArray.fromObject(treeList);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("treeList", jsonArray);
		
		JSONObject jsonObject = JSONObject.fromObject(map);
		
		return jsonObject.toString();
		
		
	}
	
	@RequestMapping(value="detail.ma", method=RequestMethod.GET)
	public ModelAndView detail(ModelAndView mv, @RequestParam("treeNo") String treeNo){
		Detail detail = ms.detail(treeNo);
		
		mv.addObject("detail", detail);
		
		mv.setViewName("detail");
		return mv;
	}
	
	@RequestMapping(value="observe.ma", method=RequestMethod.POST)
	public @ResponseBody String observe(@RequestBody String word){
		JSONParser jsonParser = new JSONParser();
		JSONObject json = new JSONObject();
		
		try {
			String searchWord = (String)jsonParser.parse(word);
			
			
			HashMap<String, String> observeResultList = ms.observe(searchWord);
			
			
			for(Map.Entry<String, String> entry : observeResultList.entrySet()){
				String key = entry.getKey();
				String value = entry.getValue();
				
				json.put(key, value);
			}
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return json.toString();
	}
	
	@RequestMapping(value="searchPage")
	public ModelAndView searchPage(ModelAndView mv, @RequestParam("item")String item){
		mv.addObject("item", item);
		mv.setViewName("searchBoard");
		
		return mv;
	}
	
	@RequestMapping(value="search.ma", method=RequestMethod.POST)
	public @ResponseBody String search(ModelAndView mv,@RequestBody String item, HttpSession session){
		ArrayList<Tree> searchResultList = null;
		
		Member m = (Member)session.getAttribute("loginUser");
		int mno = m.getmNo();
		
		System.out.println(item);
		
		JSONParser parser = new JSONParser();
		
		try {
			String itemAfter = (String)parser.parse(item);
			searchResultList = ms.search(itemAfter, mno);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		for(Tree search : searchResultList){
			System.out.println(search);
		}
		
		
		
		JSONArray array = JSONArray.fromObject(searchResultList);
		
		Map<String, Object> hashMap = new HashMap<String, Object>();
		
		hashMap.put("treeList", array);
		
		JSONObject object = JSONObject.fromObject(hashMap);
		
		return object.toString();
	}
	
	@RequestMapping(value="history.ma", method=RequestMethod.POST)
	public @ResponseBody String history(HttpSession session){
		Member m = (Member)session.getAttribute("loginUser");
		int mno = m.getmNo(); 
		
		ArrayList<String> historyList = ms.history(mno);
		 
		JSONArray array = JSONArray.fromObject(historyList);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		hashMap.put("historyList", array);
		
		JSONObject object = JSONObject.fromObject(hashMap);
		
		return object.toString();
	}
	
	@RequestMapping(value="commentaryListCount.ma")
	public void commentaryListCount(HttpServletResponse response, @RequestBody String treeNoBefore){
		JSONParser parser = new JSONParser();
		
		String treeNo = null;
		try {
			treeNo = (String)parser.parse(treeNoBefore);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		
		
		int commentaryListCount = ms.commentaryListCount(treeNo);
		
		
		
		PrintWriter pw;
		try {
			pw = response.getWriter();
			pw.println(commentaryListCount);
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="commentaryList.ma", method=RequestMethod.POST)
	public @ResponseBody String commentaryList(@RequestBody HashMap<String, String> hash){
		
		
		
		ArrayList<Commentary> commentaryList = ms.commentaryList(hash.get("treeNo"), hash.get("commentCount"));
		
		for(Commentary c : commentaryList){
			System.out.println(c);
		}
		
		JSONArray array = JSONArray.fromObject(commentaryList);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		
		hashMap.put("commentaryList", array);
		
		JSONObject object = JSONObject.fromObject(hashMap);
	
		return object.toString(); 
	}
	
	@RequestMapping(value="commentaryInsert.ma")
	public void commentaryInsert(CommentaryModel model, HttpServletResponse response){
		System.out.println("insert");
		
		try {
			String commentNo = ms.commentaryInsert(model);
			
			PrintWriter out;
			try {
				out = response.getWriter();
				out.write(commentNo);
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (Exception e1) {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.write("error");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value="getProfile.ma")
	public @ResponseBody String getProfile(@RequestBody String mNickName){
		JSONParser parser = new JSONParser();
		
		String mno = null;
		
		try {
			mno = (String)parser.parse(mNickName);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		String profile = ms.getProfile(mno);
		
		HashMap<String, String> hashMap = new HashMap<String, String>();
		
		hashMap.put("profile", profile);
		
		JSONObject object = JSONObject.fromObject(hashMap);
		
		return object.toString();
	}
	
	@RequestMapping(value="replyList.ma")
	public @ResponseBody String replyList(@RequestBody HashMap<String, String> hash){
		ArrayList<Commentary> replyList = ms.replyList(hash.get("treeNo"), hash.get("commentNo"));
		
		for(Commentary c : replyList){
			System.out.println(c);
		}
		
		JSONArray array = JSONArray.fromObject(replyList);
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		
		hashMap.put("replyList", array);
		
		JSONObject object = JSONObject.fromObject(hashMap);
	
		return object.toString(); 
	}
	
	@RequestMapping(value="checkCommentOwner.ma")
	public void checkCommentOwner(@RequestBody String JSONCommentNo, HttpServletResponse response){
		String commentNo = null;
		
		JSONParser parser = new JSONParser();
		try {
			commentNo = (String) parser.parse(JSONCommentNo);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		String commentOwnerNo = ms.checkCommentOwner(commentNo);
		
		PrintWriter pw;
		try {
			pw = response.getWriter();
			pw.println(commentOwnerNo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value="deleteCommentary.ma")
	public void deleteCommentary(HttpServletResponse response, @RequestBody String commentNo){
		
		System.out.println(commentNo);
		
		int idx = commentNo.indexOf("=");
		
		String commentNoAfter = commentNo.substring(0, idx);
		
		try {
			ms.deleteCommentary(commentNoAfter);
			
			PrintWriter out;
			try {
				out = response.getWriter();
				out.write("success");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (Exception e1) {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.write("error");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	} 
		
	
}

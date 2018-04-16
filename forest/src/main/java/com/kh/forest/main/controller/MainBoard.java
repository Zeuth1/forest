package com.kh.forest.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println(treeList);
		mv.addObject("treeList", treeList);
		mv.setViewName("mainBoard");
		return mv;
	}
	
	@RequestMapping(value="paging.ma", method=RequestMethod.POST)
	public @ResponseBody String paging(HttpServletResponse response, @RequestBody String JSONTreeArr_str){
		System.out.println("받은 이미지들" + JSONTreeArr_str);
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
		
		System.out.println("거른 후 보낸 이미지들 : " + jsonArray);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("treeList", jsonArray);
		
		JSONObject jsonObject = JSONObject.fromObject(map);
		
		return jsonObject.toString();
		
		
	}
	
	@RequestMapping(value="detail.ma", method=RequestMethod.GET)
	public ModelAndView detail(ModelAndView mv, @RequestParam("treeNo") String treeNo){
		System.out.println("첫번째 받음");
		
		System.out.println(treeNo);
		
		Detail detail = ms.detail(treeNo);
		
		System.out.println(detail);
		
		mv.addObject("detail", detail);
		
		mv.setViewName("detail");
		return mv;
	}
	
}

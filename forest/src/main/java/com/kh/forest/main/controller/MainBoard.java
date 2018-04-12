package com.kh.forest.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.forest.main.model.service.MainBoardService;

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
}

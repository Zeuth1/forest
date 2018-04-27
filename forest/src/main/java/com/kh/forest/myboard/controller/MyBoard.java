package com.kh.forest.myboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.forest.myboard.model.service.FinService;

@Controller
@SessionAttributes("loginUser")
public class MyBoard {
	
	@Autowired
	private FinService fs;
	
	//마이보드로가기
	@RequestMapping(value="myBoard.my", method=RequestMethod.GET)
	public ModelAndView myboard(ModelAndView mv){
		System.out.println("1.마이보드로!");
		mv.setViewName("myboard");
		
		return mv;
	}
	//마이보드에서 보드만들기
	
	//마이보드에서 보드 클릭시 디테일 (핀보기) = 보드디테일
	@RequestMapping(value="myBoardDetail.my", method=RequestMethod.GET)
	public ModelAndView myBoardDetail(ModelAndView mv){
		System.out.println("보드디테일!!!");
		mv.setViewName("myBoardDetail");
		
		return mv;
	}
	//마이보드에서 핀으로!
	@RequestMapping(value="myBoardFin.my", method=RequestMethod.GET)
	public ModelAndView myBoardFin(ModelAndView mv){
		System.out.println("핀으로!!");
		mv.setViewName("myBoardFin");
		
		return mv;
	}
	//핀에서 핀추가하기폼!!!
	@RequestMapping(value="finAddForm.my", method=RequestMethod.GET)
	public ModelAndView finAddForm(ModelAndView mv){
		System.out.println("핀만들기");
		mv.setViewName("finAddForm");
		return mv;
	}
	@RequestMapping(value="boardAddForm.my", method=RequestMethod.GET)
	public ModelAndView boardAddForm(ModelAndView mv){
		System.out.println("핀만들기");
		mv.setViewName("boardAddForm");
		return mv;
	}
}

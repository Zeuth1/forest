package com.kh.forest.setting.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.forest.common.Member;
import com.kh.forest.setting.model.service.SettingService;

@Controller
@SessionAttributes("loginUser")
public class Setting {

	@Resource(name="Member")
	Member m;
	
	@Autowired
	SettingService ss;
	
	@RequestMapping(value="settingPage")
	public ModelAndView goSettingPage(ModelAndView mv,HttpSession session){
		
		Member m =(Member) session.getAttribute("loginUser");
		
		
		mv.addObject("loginUser",m);
		mv.setViewName("/cashView");
		
		return mv;
	}
	
}

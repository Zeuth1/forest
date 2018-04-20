package com.kh.forest.login.controller;



import java.io.IOException;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.forest.common.Member;
import com.kh.forest.login.model.service.LoginService;

import net.sf.json.JSONObject;



@Controller
public class Login {
	
	
	@Autowired
	LoginService ls;
	@Autowired
	Member m;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping(value="enter.lo",method=RequestMethod.GET)
	public ModelAndView enterMember(ModelAndView mv){
		
		System.out.println("웰컴투 로그인");
		String aName =ls.getaName();
		mv.addObject("aName",aName);
		mv.setViewName("/insertMemberForm");
		return mv;
	}
	
	
	
	@RequestMapping(value="login.lo",method=RequestMethod.GET)
	public ModelAndView enterLogin(ModelAndView mv){
		
		
	
		String aName= ls.getaName();
		mv.addObject("aName",aName);
		mv.setViewName("/loginForm");
	
		
		
		return mv;
		
	
	
	
	}
	@RequestMapping(value="changePic.lo")
	public ModelAndView changePic(ModelAndView mv){

		
		String aName= ls.getaName();
		mv.addObject("aName",aName);
		mv.setViewName("jsonView");
		
		return mv;
		
	}
	@RequestMapping(value="checkContent.lo" , produces = "application/plain; charset=utf8" ,method=RequestMethod.POST)
	public ModelAndView checkNick(ModelAndView mv,String email, String nick){
		
		
		m.setmEmail(email);
		m.setmNickName(nick);
		
		
		int checkNum = ls.getCheck(m);
		
		if(checkNum!=0){
			if(checkNum==1) mv.addObject("message",1);
			else if(checkNum==2) mv.addObject("message",2);
			else mv.addObject("message",3);
			
		}
		else mv.addObject("message",0);
		
		mv.setViewName("jsonView");
		
		
		return mv;
	}
	
	@RequestMapping(value="insertMember.lo", method=RequestMethod.POST)
	public ModelAndView checkNick(Member m,ModelAndView mv){
		
		m.setmPwd(passwordEncoder.encode(m.getmPwd()));
		m.setmPhone(m.getmId());
		String aName =ls.getaName();
		mv.addObject("aName",aName);
		ls.insertMember(m);
		
		mv.setViewName("/loginForm");
		
		return mv;
		}
	
	@RequestMapping(value="gotomain.lo", method=RequestMethod.GET)
	public ModelAndView login(ModelAndView mv){
	
		String aName =ls.getaName();
		mv.addObject("aName",aName);
		
		mv.setViewName("/login");
		
		
		return mv;
	}
	
	@RequestMapping(value="checkMember.lo")
	public ModelAndView memberCheck(HttpSession session, ModelAndView mv, @RequestParam(value="mId")String mId, @RequestParam(value="mPwd")String mPwd){
		
		int result=ls.checkMember(mId,mPwd);
		
		if(result == 0){
			Member m = ls.sessionMaker(mId);
			session.setAttribute("loginUser", m);
		}
		
		mv.addObject("result", result);
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="find.lo", method=RequestMethod.GET)
	public ModelAndView find(ModelAndView mv){
		
		String aName =ls.getaName();
		mv.addObject("aName",aName);
		mv.setViewName("/findMember");
		
		return mv;
		
	}
	
	@RequestMapping(value="checkPhone.lo", method=RequestMethod.POST)
	public ModelAndView checkPhone(ModelAndView mv ,String id){
	
		int check = ls.checkPhone(id);
		
		mv.addObject("check",check);
	
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="checkPwd.lo", method=RequestMethod.GET)
	public ModelAndView changePwd(ModelAndView mv,String mId){
	
		String aName= ls.getaName();
		mv.addObject("aName",aName);
		mv.setViewName("/changePwd"); 
		mv.addObject("mId",mId);
		
		return mv;
	}
	@RequestMapping(value="changePwd.lo", method=RequestMethod.POST)
	public ModelAndView changepass(ModelAndView mv, String mId, String mPwd){
		
		m.setmPwd(passwordEncoder.encode(mPwd));
		m.setmId(mId);
		ls.changePwd(m);
		String aName= ls.getaName();
		mv.addObject("aName",aName);
		
		
		mv.setViewName("/loginForm");
		
		return mv;
	}
	
	@RequestMapping(value="logout.lo", method=RequestMethod.GET)
	public ModelAndView logout(ModelAndView mv, HttpSession session){
		
		session.invalidate();
		
		System.out.println("로그아웃 처리됨");
		
		mv.setViewName("/loginForm");
		return mv;		
	}
	
	
}

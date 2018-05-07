package com.kh.forest.setting.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.forest.common.Donate;
import com.kh.forest.common.Member;
import com.kh.forest.common.Tree;
import com.kh.forest.main.model.vo.History;
import com.kh.forest.setting.model.service.SettingService;
import com.kh.forest.setting.model.vo.Notice2;
import com.kh.forest.setting.model.vo.Pay;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@SessionAttributes("loginUser")
public class Setting {

	@Resource(name="Member")
	Member m;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	SettingService ss;
	@Autowired
	History his;
	@Autowired
	Tree tree;
	@Autowired
	Notice2 notice;
	@Autowired
	Donate donate;
	@Autowired
	Pay pay;
	
	@RequestMapping(value="settingPage")
	public ModelAndView goSettingPage(ModelAndView mv,HttpSession session){
		
		Member m =(Member) session.getAttribute("loginUser");
		tree.setmNo(m.getmNo());
	
		notice.setnContent(ss.getIntroduce(tree.getmNo()));
		tree.setaName(ss.getProfile(tree.getmNo()));
		mv.addObject("loginUser",m);
		mv.setViewName("/myPage");
		if(notice.getnContent()!=null) mv.addObject("introduce",notice.getnContent());
		if(tree.getaName()!=null) mv.addObject("profile",tree.getaName());
		

		List<Donate> donate=ss.getDonate(m.getmNo()); 
		if(donate !=null) mv.addObject("donate",donate);
		System.out.println("도네?"+donate);
		donate=ss.getTakeMoney(m.getmNo());
		if(donate !=null) mv.addObject("takeM",donate);
		System.out.println("도네2?:"+donate);
		
		
		
		
		
		System.out.println("mv?:"+mv);
		return mv;
	}
	
	@RequestMapping(value="comparePass")
	public ModelAndView comparePass(ModelAndView mv,String pwd1,String pwd2){
		
		int length1=pwd1.length();
		int length2=pwd2.length();
		if(!pwd1.equals(pwd2)) mv.addObject("result",2);//비밀번호 일치x
		if(length1<3) mv.addObject("result",1);//비밀번호가 세글자 이하
		if(pwd1.equals(pwd2)&&length1>=3) mv.addObject("result",3);
		mv.setViewName("jsonView");
		
		
		System.out.println(mv);
		return mv;
	}
	@RequestMapping(value="changePwd")
	public ModelAndView changePwd(ModelAndView mv, String pwd,HttpSession session){
		
		Member m=(Member) session.getAttribute("loginUser");
		m.setmPwd(passwordEncoder.encode(pwd));
		
		ss.changePwd(m);
		
		
		mv.setViewName("jsonView");
		return mv;
		
	}
	
	@RequestMapping(value="deleteSearch")
	public ModelAndView deleteSearch(ModelAndView mv,HttpSession session){
		Member m=(Member)session.getAttribute("loginUser");
		his.setMno(String.valueOf(m.getmNo()));
		mv.setViewName("jsonView");
		ss.deleteSearch(his);
		
		return mv;
	}
	@RequestMapping(value="changePic", method = RequestMethod.POST)
	public ModelAndView changePic(ModelAndView mv ,MultipartHttpServletRequest multi,HttpSession session){
		   String root = "C:/Users/Song/forest/tree/";
		   String newFileName="";
		   Member m =(Member) session.getAttribute("loginUser");
		   
//		   이전파일 지우기
		   String beforeFile=ss.getProfile(m.getmNo());
		   
		   File beforeProfile= new File(root+beforeFile);
		   if(beforeProfile.exists()&&beforeProfile.isFile()) beforeProfile.delete();
//		   이전파일 지우기끝
		   
		  Iterator<String> files = multi.getFileNames();
	        while(files.hasNext()){
	            String uploadFile = files.next();
	                         
	            MultipartFile mFile = multi.getFile(uploadFile);
	            String fileName = mFile.getOriginalFilename();
	            System.out.println("실제 파일 이름 : " +fileName);
	            newFileName = System.currentTimeMillis()+"."
	                    +fileName.substring(fileName.lastIndexOf(".")+1);
	             
	            try {
	            	
	                mFile.transferTo(new File(root+newFileName));
	                tree.setaName(newFileName);
	                tree.setbName(fileName);
	                tree.setmNo(m.getmNo());
	                tree.settType("P");
	                
	                ss.setProfilePhoto(tree);
	                mv.addObject("profile",newFileName);
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	    
	    mv.setViewName("jsonView");
		
		
				
		
		return mv;
	}
	@RequestMapping(value="changeSet",method=RequestMethod.POST)
	public @ResponseBody ModelAndView changeSet(ModelAndView mv,@RequestBody HashMap<String,String> hash, HttpSession session){
		
		m=(Member) session.getAttribute("loginUser");
		
		
		
		m.setmGender(hash.get("mGender"));
		m.setmName(hash.get("mName"));
		
		notice.setnContent(hash.get("mIntroduce"));
		notice.setnTitle("introduce");
		notice.setnType("I");
		notice.setmNo(String.valueOf(m.getmNo()));
		
		ss.setprofileEtc(m,notice);
		
		
		mv.setViewName("jsonView");
		return mv;
		
		
	}
	
	@RequestMapping(value="support")
	public ModelAndView support(ModelAndView mv,HttpSession session){
		
		Member m=(Member)session.getAttribute("loginUser");
		System.out.println(m);
		String profile=ss.getProfile(m.getmNo());
		String introduce=ss.getIntroduce(m.getmNo());
		System.out.println("profile+"+profile);
		System.out.println("introduce?"+introduce);
		mv.addObject("loginUser",m);
		if(profile!=null) mv.addObject("profile",profile);
		if(introduce!=null) mv.addObject("introduce",introduce);
		
		
		
		mv.setViewName("/support");
		
		return mv;
	}
	@RequestMapping(value="payment",method=RequestMethod.POST)
	public ModelAndView payment(ModelAndView mv, @RequestBody HashMap<String,String> jsonData,HttpSession session){
		Member m=(Member)session.getAttribute("loginUser");
		
		System.out.println(jsonData);
		
		pay.setPayNo(jsonData.get("uid"));
		pay.setUserNo(m.getmNo());
		pay.setTax(10);
		pay.setPay(Integer.parseInt(jsonData.get("price")));
		
		donate.setDonate_amount(Integer.parseInt(jsonData.get("price")));
		donate.setGiver_no(String.valueOf(m.getmNo()));
		donate.setTaker_no(String.valueOf(m.getmNo()));
		
		ss.payment(pay,donate);
		
		return mv;
	}
	
	@RequestMapping(value="getAr")
	public ModelAndView getAr(ModelAndView mv,HttpSession session){
		
		m=(Member)session.getAttribute("loginUser");
		
		List<Notice2> ar=ss.getar(m.getmNo());
		
		mv.addObject("ar",ar);
		mv.setViewName("jsonView");
		
		return mv;
		
	}
	
	}

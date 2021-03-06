package com.kh.forest.login.controller;



import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.kh.forest.common.Email;
import com.kh.forest.common.Member;
import com.kh.forest.common.TempKey;
import com.kh.forest.login.model.service.LoginService;



@Controller
@SessionAttributes("loginUser")
public class Login {
	

	
	@Autowired
	private Email mail;
	@Autowired
	private EmailSender emailSender;
	@Autowired
	LoginService ls;
	@Resource(name="Member")
	Member m;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping(value="enter.lo")
	public ModelAndView enterMember(ModelAndView mv , @RequestParam(value="socialId",required=false) String socialId,
													  @RequestParam(value="mName",required=false) String mName,
													  @RequestParam(value="mEmail",required=false) String mEmail){
		
		
		if(!(socialId==null)) 
			{mv.addObject("socialId",socialId);
			 mv.addObject("mName",mName);
			 mv.addObject("mEmail",mEmail);
			}
		
		String aName =ls.getaName();
		mv.addObject("aName",aName);
		mv.setViewName("/insertMemberForm");
		System.out.println("mv?"+mv);
		return mv;
	}
	
	
	
	@RequestMapping(value="login.lo")
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
	@RequestMapping(value="checkContent.lo" , produces = "application/plain; charset=utf8")
	public ModelAndView checkNick(ModelAndView mv, String nick){
		
		
		m.setmNickName(nick);
		
		
		int checkNum = ls.getCheck(m);
		
		if(checkNum!=0){
			if(checkNum==1) mv.addObject("message",1);
		}
		else mv.addObject("message",0);
		
		mv.setViewName("jsonView");
		
		
		return mv;
	}
	
	@RequestMapping(value="insertMember.lo")
	public ModelAndView checkNick(Member m,ModelAndView mv){
		
		m.setmPwd(passwordEncoder.encode(m.getmPwd()));
		m.setmEmail(m.getmId());
		String aName =ls.getaName();
		mv.addObject("aName",aName);
		ls.insertMember(m);
		
		mv.setViewName("/loginForm");
		
		return mv;
		}
	
	@RequestMapping(value="gotomain.lo")
	public ModelAndView login(ModelAndView mv){
	
		String aName =ls.getaName();
		mv.addObject("aName",aName);
		
		mv.setViewName("/login");
		
		
		return mv;
	}
	
	@RequestMapping(value="checkMember.lo")
	public ModelAndView memberCheck(HttpSession session,ModelAndView mv,String mId, String mPwd){
		int result=ls.checkMember(mId,mPwd);
		
		
		
		if(result ==0) {
				System.out.println(mId);
			   Member m = ls.sessionMaker(mId);
			   session.removeAttribute("loginUser");
			   System.out.println("뭐냐이건+"+session.getAttribute("loginUser"));
		       session.setAttribute("loginUser", m);
		       
		       
		       System.out.println("후세션"+session.getAttribute("loginUser"));
		
		       
		}
		mv.addObject("result",result);
		
		
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="find.lo")
	public ModelAndView find(ModelAndView mv){
		
		String aName =ls.getaName();
		mv.addObject("aName",aName);
		mv.setViewName("/findMember");
		
		return mv;
		
	}
	
	@RequestMapping(value="checkPhone.lo")
	public ModelAndView checkPhone(ModelAndView mv ,String id){
	
		int check = ls.checkPhone(id);
		
		mv.addObject("check",check);
	
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="checkPwd.lo")
	public ModelAndView changePwd(ModelAndView mv,String mId){
		String aName= ls.getaName();
		mv.addObject("aName",aName);
		mv.setViewName("/changePwd"); 
		mv.addObject("mId",mId);
		
		return mv;
	}
	@RequestMapping(value="changePwd.lo")
	public ModelAndView changepass(ModelAndView mv, String mId, String mPwd){
		
		m.setmPwd(passwordEncoder.encode(mPwd));
		m.setmId(mId);
		ls.changePwd(m);
		String aName= ls.getaName();
		mv.addObject("aName",aName);
		
		
		mv.setViewName("/loginForm");
		
		return mv;
	}
	
	@RequestMapping(value="logout.lo")
	public ModelAndView logout(ModelAndView mv, HttpSession session){
		String aName= ls.getaName();
		mv.addObject("aName",aName);
		mv.addObject("logOut",3);
		session.removeAttribute("loginUser");
		session.invalidate();
		mv.setViewName("/loginForm");
		
		return mv;
		
	}
	
	public class GoogleAuthorizationCodeTokenV4Request extends GoogleAuthorizationCodeTokenRequest {
		
		
		public GoogleAuthorizationCodeTokenV4Request(HttpTransport transport, JsonFactory jsonFactory, String clientId, String
				clientSecret, String code, String redirectUri) {
			super(transport, jsonFactory, "https://www.googleapis.com/oauth2/v4/token", clientId, clientSecret,
					code, redirectUri);
			
			
		}
		
	}
	@RequestMapping(value="google.lo")
	public ModelAndView googleLogin(HttpSession session,ModelAndView mv,
								    @RequestParam(value="idtoken",required= true) String idTokenString ,
								    @RequestParam(value="log",required= true) int log) throws GeneralSecurityException, IOException{
		
		 
		  JsonFactory jsonFactory = new JacksonFactory();
	      HttpTransport transport = new NetHttpTransport();

			GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport,  jsonFactory)
			      .setAudience(Collections.singletonList("569688176866-2fhuueq4kb1pddacn6jlomi8q5siqd48.apps.googleusercontent.com"))
			      .build();
		
	
		GoogleIdToken idToken =verifier.verify(idTokenString);

		if (idToken != null) {
		  Payload payload = idToken.getPayload();
		  String userId = payload.getSubject();
		  String email = payload.getEmail();
		  String name = (String) payload.get("name");
		  
		  int check=ls.compareId(userId);
		  if(check!=0) {
			  
			if(log==0) {
				  mv.addObject("logOut",1);
				  Member m = ls.sessionMaker2(userId);
			      session.setAttribute("loginUser", m);
				
			}
			else if(log==3) mv.addObject("logOut",5);
			else if(log==5){
				  Member m = ls.sessionMaker2(userId);
				  session.setAttribute("loginUser", m);
			  	  mv.addObject("logOut",1);
			}else if(log==4) mv.addObject("logOut",3);
			   		
		  }
		
		  mv.addObject("mEmail",email);
		  mv.addObject("mName",name);
		  mv.addObject("check",check);
		  mv.addObject("socialId",userId);
		  mv.setViewName("jsonView");
		  
		  
		  
		} else {
		  System.out.println("Invalid ID token.");
		}
		
		System.out.println(mv);
		return mv;
	}
	@RequestMapping(value="naver.lo")
	public ModelAndView naverLogin(HttpSession session, ModelAndView mv,@RequestParam(value="clientId",required=true) String clientId,int log){
	
		int check=ls.compareId(clientId);
		System.out.println("log?"+log);
		
		if(check !=0){
			if(log==0){
				Member m = ls.sessionMaker2(clientId);
				session.setAttribute("loginUser", m);
				mv.addObject("logOut",2);
			}
			else if(log==3) mv.addObject("logOut",4);
			else if(log==4){
				Member m = ls.sessionMaker2(clientId);
				session.setAttribute("loginUser", m);
				mv.addObject("logOut",2);
			}else if(log==5) mv.addObject("logOut",3);
		}
		
		mv.addObject("check",check);
		mv.setViewName("jsonView");
		System.out.println(mv);
		return mv;
	}
	@RequestMapping(value="checkMail")
	public ModelAndView checkMail(ModelAndView mv, String email){
		
		int result = ls.checkMail(email);
		mv.addObject("result",result);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping(value="sendMail")
	public ModelAndView sendMail(String email,ModelAndView mv) throws Exception{
		System.out.println("email오니?:"+email);
		TempKey key = new TempKey();
		 String code=key.getKey(10, false);
		 mail.setContent("인증번호는  "+code+"입니다");mail.setReceiver(email);
		 mail.setSubject("Forest인증번호 발송 메일입니다.");
		 emailSender.SendEmail(mail);
		 
		 
		 
		 mv.addObject("code",code);
		 mv.setViewName("jsonView");
		 

		
		
		return mv;
	}
	@RequestMapping(value="sendCode")
	public ModelAndView sendCode(String id, ModelAndView mv) throws Exception{
		
		TempKey key = new TempKey();
		String code=key.getKey(15, false);
		 mail.setContent("인증번호는  "+code+" 입니다");
		
		 mail.setReceiver(id);
		 mail.setSubject("Forest인증번호 발송 메일입니다.");
		emailSender.SendEmail(mail);
		
		mv.addObject("code",code);
		mv.setViewName("jsonView");
		
		
		
		return mv;
	}
	
}

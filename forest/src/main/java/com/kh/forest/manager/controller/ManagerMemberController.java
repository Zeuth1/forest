package com.kh.forest.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.kh.forest.common.Donate;
import com.kh.forest.common.Member;
import com.kh.forest.manager.model.service.ManagerService;
import com.kh.forest.manager.model.vo.RankAgeByWriter;
import com.kh.forest.manager.model.vo.RankGender;
import com.kh.forest.manager.model.vo.Report;

@Controller
public class ManagerMemberController {

	// 오토와이어
	@Autowired
	private ManagerService ms;

	@RequestMapping("a_memberSearchAll.man")
	@ResponseBody
	public void memberSerchAll(@RequestBody String onclick, @RequestParam("page") int page,
			HttpServletResponse response) throws Exception {
		System.out.println(onclick);
		int count = 0;
		ArrayList<Member> list = ms.memberSerchAll(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	@RequestMapping("a_memberSerchOne.man")
	@ResponseBody
	public void memberSerchOne(@RequestParam("searchcon") String searchcon, @RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {

		System.out.println(searchcon);
		System.out.println(searchval);
		int count = 0;
		ArrayList<Member> list = ms.memberSerchOne(searchval, searchcon);
		response.setCharacterEncoding("utf-8");
		System.out.println(list);
		new Gson().toJson(list, response.getWriter());

	}

	@RequestMapping("a_memberUpdate.man")
	@ResponseBody
	public void memberUpdate(@RequestParam("mNo") int mNo, @RequestParam("mPwd") String mPwd,
			@RequestParam("mPhone") String mPhone, @RequestParam("mEmail") String mEmail,
			@RequestParam("mLevel") String mLevel, @RequestParam("mNickName") String mNickName,
			HttpServletResponse response) throws Exception {

		ms.memberUpdate(mNo, mPwd, mPhone, mEmail, mLevel, mNickName);

	}

	@RequestMapping("a_memberSearchAllcount.man")
	@ResponseBody
	public void memberAllcount(@RequestParam("onclick") String onclick, HttpServletResponse response) throws Exception {
		int count = ms.countMemberAll();
		int page = 0;
		page = (count / 20) + 1;
		Math.round(page);
		new Gson().toJson(page, response.getWriter());
	}

	@RequestMapping("a_memberReportStatusNoAllcount.man")
	@ResponseBody
	public void memberReportStatusNoAllcount(@RequestParam("onclick") String onclick, HttpServletResponse response)
			throws Exception {
		int count = ms.memberReportStatusNoAllcount();
		int page = 0;
		page = (count / 20) + 1;
		Math.round(page);
		new Gson().toJson(page, response.getWriter());
	}

	@RequestMapping("a_memberReportStatusNoAll.man")
	@ResponseBody
	public void memberReportStatusNoAll(@RequestParam("page") int page, HttpServletResponse response) throws Exception {
		ArrayList<Report> list = ms.memberReportStatusNoAll(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	@RequestMapping("a_memberReportStatusYesAllcount.man")
	@ResponseBody
	public void memberReportStatusYesAllcount(@RequestParam("onclick") String onclick, HttpServletResponse response)
			throws Exception {
		int count = ms.memberReportStatusYesAllcount();
		int page = 0;
		page = (count / 20) + 1;
		Math.round(page);
		new Gson().toJson(page, response.getWriter());
	}

	@RequestMapping("a_memberReportStatusYesAll.man")
	@ResponseBody
	public void memberReportStatusYesAll(@RequestParam("page") int page, HttpServletResponse response)
			throws Exception {
		ArrayList<Report> list = ms.memberReportStatusYesAll(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	@RequestMapping("a_memberReportSearchCount.man")
	@ResponseBody
	public void memberReportSearchCount(@RequestParam("onclick") String onclick,
			@RequestParam("searchcon") String searchcon, @RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {
		int count = ms.memberReportSearchCount(searchval,searchcon);
		int page = 0;
		page = (count / 20) + 1;
		Math.round(page);
		new Gson().toJson(page, response.getWriter());
	}

	@RequestMapping("a_memberReportSearch.man")
	@ResponseBody
	public void memberReportSearch(@RequestParam("page") int page, @RequestParam("onclick") String onclick,
			@RequestParam("searchcon") String searchcon, @RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {
		System.out.println(page+searchval+searchcon);
		ArrayList<Report> list = ms.memberReportSearch(page,searchval,searchcon);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}
	
	@RequestMapping("a_judgeMember.man")
	@ResponseBody
	public void judgeMember(@RequestParam("userId") String userId,@RequestParam("judge") String judge,
			HttpServletResponse response) throws Exception {
		System.out.println(userId+judge);
		int result=ms.judgeMember(judge,userId);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(result, response.getWriter());
	}
	
	@RequestMapping("a_memberReportAll.man")
	@ResponseBody
	public void memberReportAll( @RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {
		System.out.println(searchval);
		ArrayList<Report> list = ms.memberReportAll(searchval);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}
	
	@RequestMapping("a_memberReturnRetire.man")
	@ResponseBody
	public void memberReturnRetire( @RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {
		System.out.println(searchval);
		int result=ms.memberReturnRetire(searchval);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(result, response.getWriter());
	}
}

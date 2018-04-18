package com.kh.forest.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.kh.forest.common.Member;
import com.kh.forest.manager.model.service.ManagerService;
import com.kh.forest.manager.model.vo.RankGender;

@Controller
public class ManagerController {

	// 오토와이어
	@Autowired
	private ManagerService ms;


	@RequestMapping("a_memberSerchAll.man")
	@ResponseBody
	public void memberSerchAll(@RequestBody String onclick, HttpServletResponse response) throws Exception {
		System.out.println(onclick);
		int count = 0;
		ArrayList<Member> list = ms.memberSerchAll();
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
		new Gson().toJson(list, response.getWriter());

	}

	@RequestMapping("a_memberUpdate.man")
	@ResponseBody
	public void memberUpdate(@RequestParam("mNo") int mNo,@RequestParam("mPwd") String mPwd, @RequestParam("mPhone") String mPhone,
			@RequestParam("mEmail") String mEmail, @RequestParam("mLevel") String mLevel,
			@RequestParam("mNickName") String mNickName, HttpServletResponse response) throws Exception {

		
		ms.memberUpdate(mNo,mPwd,mPhone,mEmail,mLevel,mNickName);

	}

	@RequestMapping("a_chartGenderNum.man")
	@ResponseBody
	public void chartGenderNum(@RequestParam("onclick") String onclick, HttpServletResponse response) throws Exception {
		System.out.println(onclick);
		int gender[] = new int[2];
		gender = ms.chartGenderNum();
		ArrayList<Integer> list = new ArrayList<>();
		list.add(gender[0]);
		list.add(gender[1]);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	@RequestMapping("a_chartGenderByTop3Male.man")
	@ResponseBody
	public void chartByTop3male(@RequestParam("onclick") String onclick, HttpServletResponse response)
			throws Exception {
		System.out.println(onclick);
		ArrayList<RankGender> list = ms.rank3byGenderMale();
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	@RequestMapping("a_chartGenderByTop3Female.man")
	@ResponseBody
	public void chartGenderByTop3Female(@RequestParam("onclick") String onclick, HttpServletResponse response)
			throws Exception {
		System.out.println(onclick);
		ArrayList<RankGender> list = ms.rank3byGenderFemale();
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	@RequestMapping("a_chartAgeNum.man")
	@ResponseBody
	public void chartAgeNum(@RequestParam("onclick") String onclick, HttpServletResponse response) throws Exception {
		System.out.println(onclick);
		int age[] = new int[6];
		age = ms.chartAgeNum();
		ArrayList<Integer> list = new ArrayList<>();
		for (int i = 0; i < age.length; i++) {

			list.add(age[i]);
		}
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}
}

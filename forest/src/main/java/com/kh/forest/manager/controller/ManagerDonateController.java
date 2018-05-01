package com.kh.forest.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.forest.common.Donate;
import com.kh.forest.manager.model.service.ManagerService;

@Controller
public class ManagerDonateController {

	// 오토와이어
	@Autowired
	private ManagerService ms;
	
	@RequestMapping("a_donateSearchAll.man")
	@ResponseBody
	public void donateSearchAll(@RequestParam("onclick") String onclick, @RequestParam("page") int page, 
			HttpServletResponse response) throws Exception {

		System.out.println(onclick+page);
		ArrayList<Donate> list = ms.donateSearchAll(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}
	@RequestMapping("a_donateSearchTOne.man")
	@ResponseBody
	public void donateSearchTOne(@RequestParam("onclick") String onclick, @RequestParam("searchval") String searchval,@RequestParam("page") int page,
			HttpServletResponse response) throws Exception {

		System.out.println(onclick+searchval);
		int count = 0;
		ArrayList<Donate> list = ms.donateSearchTOne(searchval,page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}
	@RequestMapping("a_donateSearchTSum.man")
	@ResponseBody
	public void donateSearchTSum(@RequestParam("onclick") String onclick, @RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {

		System.out.println(onclick+searchval);
		int count = 0;
		ArrayList<Donate> list = ms.donateSearchTSum(searchval);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}
	@RequestMapping("a_donateSearchGOne.man")
	@ResponseBody
	public void donateSearchGOne(@RequestParam("onclick") String onclick, @RequestParam("searchval") String searchval,@RequestParam("page") int page,
			HttpServletResponse response) throws Exception {

		System.out.println(onclick+searchval);
		int count = 0;
		ArrayList<Donate> list = ms.donateSearchGOne(searchval,page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}
	@RequestMapping("a_donateSearchGSum.man")
	@ResponseBody
	public void donateSearchGSum(@RequestParam("onclick") String onclick, @RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {

		System.out.println(onclick+searchval);
		int count = 0;
		ArrayList<Donate> list = ms.donateSearchGSum(searchval);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}
	@RequestMapping("a_countdonation.man")
	@ResponseBody
	public void countdonation(@RequestParam("page") int page, HttpServletResponse response) throws Exception {
		int count=ms.countdonation();
		page=(count/20)+1;
		Math.round(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(page, response.getWriter());
	}
	@RequestMapping("a_CountdonateSearch.man")
	@ResponseBody
	public void CountdonateSearch(@RequestParam("page") int page,@RequestParam("searchcon") String searchcon,@RequestParam("searchval") String searchval, HttpServletResponse response) throws Exception {
		int count=ms.CountdonateSearch(searchcon,searchval);
		page=(count/20)+1;
		Math.round(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(page, response.getWriter());
	}
}

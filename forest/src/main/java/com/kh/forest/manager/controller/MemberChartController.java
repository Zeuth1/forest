package com.kh.forest.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.forest.manager.model.service.ManagerService;
import com.kh.forest.manager.model.vo.RankAgeByWriter;
import com.kh.forest.manager.model.vo.RankGender;

@Controller
public class MemberChartController {
	// 오토와이어
	@Autowired
	private ManagerService ms;
	

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
	@RequestMapping("a_rankAge10Writer.man")
	@ResponseBody
	public void Age10Writer(@RequestParam("onclick") String onclick, HttpServletResponse response) throws Exception {
		System.out.println(onclick);
		ArrayList<RankAgeByWriter>list = ms.RankAgeByWriter10();
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}
}

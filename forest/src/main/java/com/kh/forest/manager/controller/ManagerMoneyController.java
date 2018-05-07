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
import com.kh.forest.manager.model.vo.Calcul;
import com.kh.forest.manager.model.vo.Refund;

@Controller
public class ManagerMoneyController {

	// 오토와이어
	@Autowired
	private ManagerService ms;

	@RequestMapping("a_donateSearchAll.man")
	@ResponseBody
	public void donateSearchAll(@RequestParam("onclick") String onclick, @RequestParam("page") int page,
			HttpServletResponse response) throws Exception {

		System.out.println(onclick + page);
		ArrayList<Donate> list = ms.donateSearchAll(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}

	@RequestMapping("a_donateSearchTOne.man")
	@ResponseBody
	public void donateSearchTOne(@RequestParam("onclick") String onclick, @RequestParam("searchval") String searchval,
			@RequestParam("page") int page, HttpServletResponse response) throws Exception {

		System.out.println(onclick + searchval);
		int count = 0;
		ArrayList<Donate> list = ms.donateSearchTOne(searchval, page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}

	@RequestMapping("a_donateSearchTSum.man")
	@ResponseBody
	public void donateSearchTSum(@RequestParam("onclick") String onclick, @RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {

		System.out.println(onclick + searchval);
		int count = 0;
		ArrayList<Donate> list = ms.donateSearchTSum(searchval);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}

	@RequestMapping("a_donateSearchGOne.man")
	@ResponseBody
	public void donateSearchGOne(@RequestParam("onclick") String onclick, @RequestParam("searchval") String searchval,
			@RequestParam("page") int page, HttpServletResponse response) throws Exception {

		System.out.println(onclick + searchval);
		int count = 0;
		ArrayList<Donate> list = ms.donateSearchGOne(searchval, page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}

	@RequestMapping("a_donateSearchGSum.man")
	@ResponseBody
	public void donateSearchGSum(@RequestParam("onclick") String onclick, @RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {

		System.out.println(onclick + searchval);
		int count = 0;
		ArrayList<Donate> list = ms.donateSearchGSum(searchval);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}

	@RequestMapping("a_countdonation.man")
	@ResponseBody
	public void countdonation(@RequestParam("page") int page, HttpServletResponse response) throws Exception {
		int count = ms.countdonation();
		page = (count / 20) + 1;
		Math.round(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(page, response.getWriter());
	}

	@RequestMapping("a_CountdonateSearch.man")
	@ResponseBody
	public void CountdonateSearch(@RequestParam("page") int page, @RequestParam("searchcon") String searchcon,
			@RequestParam("searchval") String searchval, HttpServletResponse response) throws Exception {
		int count = ms.CountdonateSearch(searchcon, searchval);
		page = (count / 20) + 1;
		Math.round(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(page, response.getWriter());
	}

	@RequestMapping("a_CountAccount.man")
	@ResponseBody
	public void CountAccount(@RequestParam("page") int page, HttpServletResponse response) throws Exception {
		int count = ms.CountAccount();
		page = (count / 20) + 1;
		Math.round(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(page, response.getWriter());
	}

	@RequestMapping("a_AccountSearchAll.man")
	@ResponseBody
	public void AccountSearchAll(@RequestParam("onclick") String onclick, @RequestParam("page") int page,
			HttpServletResponse response) throws Exception {

		System.out.println(onclick);
		ArrayList<Donate> list = ms.AccountSearchAll(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}

	@RequestMapping("a_AccountSearch.man")
	@ResponseBody
	public void AccountSearch(@RequestParam("onclick") String onclick, @RequestParam("searchcon") String searchcon,
			@RequestParam("searchval") String searchval, HttpServletResponse response) throws Exception {

		System.out.println(onclick);
		ArrayList<Donate> list = ms.AccountSearch(searchcon,searchval);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());

	}
	@RequestMapping("a_CountNotRefund.man")
	@ResponseBody
	public void CountNotRefund(@RequestParam("page") int page, HttpServletResponse response) throws Exception {
		int count = ms.CountNotRefund();
		page = (count / 20) + 1;
		Math.round(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(page, response.getWriter());
	}
	
	@RequestMapping("a_CountRefund.man")
	@ResponseBody
	public void CountRefund(@RequestParam("page") int page, HttpServletResponse response) throws Exception {
		int count = ms.CountRefund();
		page = (count / 20) + 1;
		Math.round(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(page, response.getWriter());
	}
	@RequestMapping("a_SearchNotRefundAll.man")
	@ResponseBody
	public void SearchNotRefundAll(@RequestParam("onclick") String onclick, @RequestParam("page") int page,
			HttpServletResponse response) throws Exception {

		System.out.println(onclick + page);
		ArrayList<Refund> list = ms.SearchNotRefundAll(page);
		response.setCharacterEncoding("utf-8");
		System.out.println(list);
		new Gson().toJson(list, response.getWriter());

	}
	@RequestMapping("a_SearchRefundAll.man")
	@ResponseBody
	public void SearchRefundAll(@RequestParam("onclick") String onclick, @RequestParam("page") int page,
			HttpServletResponse response) throws Exception {

		System.out.println(onclick + page);
		ArrayList<Refund> list = ms.SearchRefundAll(page);
		response.setCharacterEncoding("utf-8");
		System.out.println(list);
		new Gson().toJson(list, response.getWriter());

	}
	@RequestMapping("a_CountSearchRefund.man")
	@ResponseBody
	public void CountSearchRefund(@RequestParam("page") int page,@RequestParam("searchval") String searchval, HttpServletResponse response) throws Exception {
		int count = ms.CountSearchRefund(searchval);
		page = (count / 20) + 1;
		Math.round(page);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(page, response.getWriter());
	}
	
	@RequestMapping("a_SearchRefund.man")
	@ResponseBody
	public void SearchRefund(@RequestParam("page") int page,@RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {

		System.out.println("onclick" + page+searchval);
		ArrayList<Refund> list = ms.SearchRefund(page,searchval);
		response.setCharacterEncoding("utf-8");
		System.out.println(list);
		new Gson().toJson(list, response.getWriter());

	}
	@RequestMapping("a_UpdateRefundStatus.man")
	@ResponseBody
	public void UpdateRefundStatus(@RequestParam("number") int number,
			HttpServletResponse response) throws Exception {

		System.out.println("onclick" + number);
		int result = ms.UpdateRefundStatus(number);
		response.setCharacterEncoding("utf-8");
		System.out.println(result);
		new Gson().toJson(result, response.getWriter());

	}
	@RequestMapping("a_donateSearchIDAll.man")
	@ResponseBody
	public void donateSearchIDAll(@RequestParam("searchval") String searchval,
			HttpServletResponse response) throws Exception {

		System.out.println("onclick" + searchval);
		int[] list = ms.donateSearchIDAll(searchval);
		response.setCharacterEncoding("utf-8");
		System.out.println(list);
		new Gson().toJson(list, response.getWriter());

	}
	@RequestMapping("a_calcul.man")
	@ResponseBody
	public void calcul(@RequestParam("onclick") String onclick,@RequestParam("year") String year,
			HttpServletResponse response) throws Exception {

		System.out.println("onclick");
		ArrayList<Calcul> list = ms.calcul(year);
		response.setCharacterEncoding("utf-8");
		System.out.println(list);
		new Gson().toJson(list, response.getWriter());

	}
}

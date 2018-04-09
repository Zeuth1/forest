package com.kh.forest.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forest.manager.model.service.AdminService;
import com.kh.forest.manager.model.vo.Member;

@Controller
public class Manager {
	// <뷰 쪽 부분>
	/* 맴버 */
	@RequestMapping("a_memberSearchView.man")
	public String a_memberSearchView() {
		return "manager/member/member_search";
	}

	/* 결제 */
	@RequestMapping("a_moneyDonationView.man")
	public String a_moneyDonationView() {
		return "manager/money/money_donation";
	}

	/* 차트 */
	@RequestMapping("a_chartMainView.man")
	public String a_chartMainView() {
		return "manager/chart/chart_main";
	}

	// <서비스 부분>
	@Autowired
	private AdminService as;

	@RequestMapping("a_memberSerchAll.man")
	public String a_memberSerchAll(HttpServletResponse response) {

		ArrayList<Member> list = as.a_memberSerchAll();

		return "manager/chart/chart_main";
	}

}

package com.kh.forest.manager.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forest.manager.model.service.AdminService;
import com.kh.forest.manager.model.vo.Mem;


@Controller
public class Manager {
	// <�� �� �κ�>
	/* �ɹ� */
	@RequestMapping("a_memberSearchView.man")
	public String a_memberSearchView() {
		return "manager/member/member_search";
	}

	/* ���� */
	@RequestMapping("a_moneyDonationView.man")
	public String a_moneyDonationView() {
		return "manager/money/money_donation";
	}

	/* ��Ʈ */
	@RequestMapping("a_chartMainView.man")
	public String a_chartMainView() {
		return "manager/chart/chart_main";
	}

	// <���� �κ�>
	@Autowired
	private AdminService as;

	@RequestMapping("a_memberSerchAll.man")
	public String a_memberSerchAll(HttpServletResponse response) {

		ArrayList<Mem> list = as.a_memberSerchAll();

		return "manager/chart/chart_main";
	}

}

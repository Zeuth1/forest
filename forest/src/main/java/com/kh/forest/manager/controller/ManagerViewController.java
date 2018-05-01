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
public class ManagerViewController {

	// 오토와이어
	@Autowired
	private ManagerService ms;

	// <뷰>
	@RequestMapping("a_gotoMainPage.man")
	public String a_gotoMainPage() {
		return "/admin_main";
	}
	/* 회원전체조회 */

	
	@RequestMapping("a_memberSearchView.man")
	public String a_memberSearchView() {
		return "/member/member_search";
	}

	@RequestMapping("a_memberDetailView.man")
	public String a_memberDetailView(@RequestParam("mId") int mId, Model model) {
		model.addAttribute("mId", mId);
		return "/member/member_detail";
	}
	
	@RequestMapping("a_memberReportView.man")
	public String a_memberReportView() {
		return "/member/member_report";
	}


	/* 후원전체조회 */
	@RequestMapping("a_moneyDonationView.man")
	public String a_moneyDonationView() {
		return "/money/money_donation";
	}
	@RequestMapping("a_moneyRefundView.man")
	public String a_moneyRefundView() {
		return "/money/money_refund";
	}
	@RequestMapping("a_moneyAccountView.man")
	public String a_moneyAccountView() {
		return "/money/money_account";
	}

	/* 차트조회 */

	@RequestMapping("a_chartGenderView.man")
	public String a_chartGenderView() {
		return "/chart/chart_gender";
	}

	@RequestMapping("a_chartArtistView.man")
	public String a_chartArtistView() {
		return "/chart/chart_artist";
	}
	// <���� �κ�>

}

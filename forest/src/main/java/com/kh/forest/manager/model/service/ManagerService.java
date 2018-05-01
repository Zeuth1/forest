package com.kh.forest.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.forest.common.Donate;
import com.kh.forest.common.Member;
import com.kh.forest.manager.model.vo.RankAgeByWriter;
import com.kh.forest.manager.model.vo.RankGender;
import com.kh.forest.manager.model.vo.Refund;
import com.kh.forest.manager.model.vo.Report;

public interface ManagerService {

	ArrayList<Member> memberSerchAll(int page);

	ArrayList<Member> memberSerchOne(String searchval, String searchcon);

	int[] chartGenderNum();

	ArrayList<RankGender> rank3byGenderMale();

	ArrayList<RankGender> rank3byGenderFemale();

	int[] chartAgeNum();

	void memberUpdate(int mNo, String mPwd, String mPhone, String mEmail, String mLevel, String mNickName);

	ArrayList<RankAgeByWriter> RankAgeByWriter10();

	ArrayList<Donate> donateSearchAll(int page);

	ArrayList<Donate> donateSearchTOne(String searchval, int page);

	ArrayList<Donate> donateSearchTSum(String searchval);

	ArrayList<Donate> donateSearchGOne(String searchval, int page);

	ArrayList<Donate> donateSearchGSum(String searchval);

	int countdonation();

	int CountdonateSearch(String searchcon, String searchval);

	int countMemberAll();

	int CountAccount();

	ArrayList<Donate> AccountSearchAll(int page);

	ArrayList<Donate> AccountSearch(String searchcon, String searchval);

	int CountNotRefund();

	int CountRefund();

	ArrayList<Refund> SearchNotRefundAll(int page);

	ArrayList<Refund> SearchRefundAll(int page);

	int CountSearchRefund(String searchval);

	ArrayList<Refund> SearchRefund(int page, String searchval);

	int UpdateRefundStatus(int number);

	int memberReportStatusNoAllcount();

	ArrayList<Report> memberReportStatusNoAll(int page);

	int memberReportStatusYesAllcount();

	ArrayList<Report> memberReportStatusYesAll(int page);

	int memberReportSearchCount(String searchval, String searchcon);

	ArrayList<Report> memberReportSearch(int page, String searchval, String searchcon);

	int judgeMember(String judge,String userId);

	ArrayList<Report> memberReportAll(String searchval);

	int[] donateSearchIDAll(String searchval);

	int memberReturnRetire(String searchval);


	



}

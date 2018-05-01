package com.kh.forest.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forest.common.Donate;
import com.kh.forest.common.Member;
import com.kh.forest.manager.model.dao.ManagerDao;
import com.kh.forest.manager.model.vo.RankAgeByWriter;
import com.kh.forest.manager.model.vo.RankGender;
import com.kh.forest.manager.model.vo.Refund;
import com.kh.forest.manager.model.vo.Report;
@Service
public class ManagerServiceImpl implements ManagerService {
@Autowired
private SqlSessionTemplate sqlsession;
@Autowired
private ManagerDao md;

	@Override
	public ArrayList<Member> memberSerchAll(int page) {
		// TODO Auto-generated method stub
		ArrayList<Member>list=md.memberSerchAll(sqlsession,page);
		return list;
	}
	@Override
	public ArrayList<Member> memberSerchOne(String searchval, String searchcon) {
		// TODO Auto-generated method stub
		ArrayList<Member>list=md.memberSerchOne(sqlsession,searchval,searchcon);
		return list;
	}
	@Override
	public int[] chartGenderNum() {
		// TODO Auto-generated method stub
		int[] gender=new int[2];
		gender = md.chartGenderNum(sqlsession);
		return gender;
	}
	@Override
	public ArrayList<RankGender> rank3byGenderMale() {
		// TODO Auto-generated method stub
		ArrayList<RankGender>list=md.rank3byGenderMale(sqlsession);
		return list;
	}
	@Override
	public ArrayList<RankGender> rank3byGenderFemale() {
		// TODO Auto-generated method stub
		ArrayList<RankGender>list=md.rank3byGenderFemale(sqlsession);
		return list;
	}
	@Override
	public int[] chartAgeNum() {
		// TODO Auto-generated method stub
		int[] age=new int[6];
		age = md.chartAgeNum(sqlsession);
		return age;
	}
	@Override
	public void memberUpdate(int mNo,String mPwd, String mPhone, String mEmail, String mLevel, String mNickName) {
		// TODO Auto-generated method stub
		md.memberUpdate(sqlsession,mNo,mPwd,mPhone,mEmail,mLevel,mNickName);
	}
	@Override
	public ArrayList<RankAgeByWriter> RankAgeByWriter10() {
		// TODO Auto-generated method stub
		ArrayList<RankAgeByWriter>list=md.RankAgeByWriter10(sqlsession);
		return list;
	}
	@Override
	public ArrayList<Donate> donateSearchAll(int page) {
		// TODO Auto-generated method stub
		ArrayList<Donate>list = md.donateSearchAll(sqlsession,page);
		return list;
	}
	@Override
	public ArrayList<Donate> donateSearchTOne(String searchval,int page) {
		// TODO Auto-generated method stub
		ArrayList<Donate>list = md.donateSearchTOne(sqlsession,searchval,page);
		return list;
	}
	@Override
	public ArrayList<Donate> donateSearchTSum(String searchval) {
		// TODO Auto-generated method stub
		ArrayList<Donate>list = md.donateSearchTSum(sqlsession,searchval);
		return list;
	}
	@Override
	public ArrayList<Donate> donateSearchGOne(String searchval,int page) {
		// TODO Auto-generated method stub
		ArrayList<Donate>list = md.donateSearchGOne(sqlsession,searchval,page);
		return list;
	}
	@Override
	public ArrayList<Donate> donateSearchGSum(String searchval) {
		// TODO Auto-generated method stub
		ArrayList<Donate>list = md.donateSearchGSum(sqlsession,searchval);
		return list;
	}
	@Override
	public int countdonation() {
		// TODO Auto-generated method stub
		int count = md.countdonation();
		return count;
	}
	@Override
	public int CountdonateSearch(String searchcon,String searchval) {
		// TODO Auto-generated method stub
		int count = md.CountdonateSearch(sqlsession,searchcon,searchval);
		return count;
	}
	@Override
	public int countMemberAll() {
		// TODO Auto-generated method stub
		int count=md.countMemberAll(sqlsession);
		return count;
	}
	@Override
	public int CountAccount() {
		// TODO Auto-generated method stub
		int count=md.CountAccount(sqlsession);
		return count;
	}
	@Override
	public ArrayList<Donate> AccountSearchAll(int page) {
		// TODO Auto-generated method stub
		ArrayList<Donate>list=md.AccountSearchAll(page);
		return list;
	}
	@Override
	public ArrayList<Donate> AccountSearch(String searchcon, String searchval) {
		// TODO Auto-generated method stub
		ArrayList<Donate>list=md.AccountSearch(searchcon,searchval);
		return list;
	}
	@Override
	public int CountNotRefund() {
		// TODO Auto-generated method stub
		int count=md.CountNotRefund(sqlsession);
		return count;
	}
	@Override
	public int CountRefund() {
		// TODO Auto-generated method stub
		int count=md.CountRefund(sqlsession);
		return count;
	}
	@Override
	public ArrayList<Refund> SearchNotRefundAll(int page) {
		// TODO Auto-generated method stub
		ArrayList<Refund>list =md.SearchNotRefundAll(sqlsession,page);
		return list;
	}
	@Override
	public ArrayList<Refund> SearchRefundAll(int page) {
		// TODO Auto-generated method stub
		ArrayList<Refund>list =md.SearchRefundAll(sqlsession,page);
		return list;
	}
	@Override
	public int CountSearchRefund(String searchval) {
		// TODO Auto-generated method stub
		int count=md.CountSearchRefund(sqlsession,searchval);
		return count;
	}
	@Override
	public ArrayList<Refund> SearchRefund(int page, String searchval) {
		// TODO Auto-generated method stub
		ArrayList<Refund>list=md.SearchRefund(sqlsession,page,searchval);
		return list;
	}
	@Override
	public int UpdateRefundStatus(int number) {
		// TODO Auto-generated method stub
		int result=md.UpdateRefundStatus(sqlsession,number);
		return result;
	}
	@Override
	public int memberReportStatusNoAllcount() {
		// TODO Auto-generated method stub
		int count=md.memberReportStatusNoAllcount(sqlsession);
		return count;
	}
	@Override
	public ArrayList<Report> memberReportStatusNoAll(int page) {
		// TODO Auto-generated method stub
		ArrayList<Report>list=md.memberReportStatusNoAll(sqlsession,page);
		return list;
	}
	@Override
	public int memberReportStatusYesAllcount() {
		// TODO Auto-generated method stub
		int count=md.memberReportStatusYesAllcount(sqlsession);
		return count;
	}
	@Override
	public ArrayList<Report> memberReportStatusYesAll(int page) {
		// TODO Auto-generated method stub
		ArrayList<Report>list=md.memberReportStatusYesAll(sqlsession,page);
		return list;
	}
	@Override
	public int memberReportSearchCount(String searchval, String searchcon) {
		// TODO Auto-generated method stub
		int count=md.memberReportSearchCount(sqlsession,searchval,searchcon);
		return count;
	}
	@Override
	public ArrayList<Report> memberReportSearch(int page, String searchval, String searchcon) {
		// TODO Auto-generated method stub
		ArrayList<Report>list=md.memberReportSearch(sqlsession,page,searchval,searchcon);
		return list;
	}
	@Override
	public int judgeMember(String judge,String userId) {
		// TODO Auto-generated method stub
		int result=md.judgeMember(sqlsession,judge,userId);
		return result;
	}
	@Override
	public ArrayList<Report> memberReportAll(String searchval) {
		// TODO Auto-generated method stub
		ArrayList<Report>list=md.memberReportAll(sqlsession,searchval);
		return list;
	}
	@Override
	public int[] donateSearchIDAll(String searchval) {
		// TODO Auto-generated method stub
		int[] list=md.donateSearchIDAll(sqlsession, searchval);
		return list;
	}
	@Override
	public int memberReturnRetire(String searchval) {
		// TODO Auto-generated method stub
		int result=md.memberReturnRetire(sqlsession,searchval);
		return result;
	}

	
	


}

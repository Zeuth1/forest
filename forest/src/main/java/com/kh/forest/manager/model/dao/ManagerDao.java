package com.kh.forest.manager.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forest.common.Donate;
import com.kh.forest.common.Member;
import com.kh.forest.manager.model.vo.Calcul;
import com.kh.forest.manager.model.vo.RankAgeByWriter;
import com.kh.forest.manager.model.vo.RankGender;
import com.kh.forest.manager.model.vo.Refund;
import com.kh.forest.manager.model.vo.Report;

public interface ManagerDao {

	ArrayList<Member> memberSerchAll(SqlSessionTemplate sqlsession, int page);

	ArrayList<Member> memberSerchOne(SqlSessionTemplate sqlsession, String searchval, String searchcon);

	int[] chartGenderNum(SqlSessionTemplate sqlsession);

	ArrayList<RankGender> rank3byGenderMale(SqlSessionTemplate sqlsession);

	ArrayList<RankGender> rank3byGenderFemale(SqlSessionTemplate sqlsession);

	int[] chartAgeNum(SqlSessionTemplate sqlsession);

	void memberUpdate(SqlSessionTemplate sqlsession, int mNo, String mPwd, String mPhone, String mEmail, String mLevel,
			String mNickName);

	ArrayList<RankAgeByWriter> RankAgeByWriter10(SqlSessionTemplate sqlsession);

	ArrayList<Donate> donateSearchAll(SqlSessionTemplate sqlsession,int page);

	ArrayList<Donate> donateSearchTOne(SqlSessionTemplate sqlsession, String searchval, int page);

	ArrayList<Donate> donateSearchTSum(SqlSessionTemplate sqlsession, String searchval);

	ArrayList<Donate> donateSearchGOne(SqlSessionTemplate sqlsession, String searchval, int page);

	ArrayList<Donate> donateSearchGSum(SqlSessionTemplate sqlsession, String searchval);

	int countdonation();

	int CountdonateSearch(SqlSessionTemplate sqlsession, String searchcon, String searchval);

	int countMemberAll(SqlSessionTemplate sqlsession);

	int CountAccount(SqlSessionTemplate sqlsession);

	ArrayList<Donate> AccountSearchAll(int page);

	ArrayList<Donate> AccountSearch(String searchcon, String searchval);

	int CountNotRefund(SqlSessionTemplate sqlsession);

	int CountRefund(SqlSessionTemplate sqlsession);

	ArrayList<Refund> SearchNotRefundAll(SqlSessionTemplate sqlsession, int page);

	ArrayList<Refund> SearchRefundAll(SqlSessionTemplate sqlsession, int page);

	int CountSearchRefund(SqlSessionTemplate sqlsession, String searchval);

	ArrayList<Refund> SearchRefund(SqlSessionTemplate sqlsession,int page, String searchval);

	int UpdateRefundStatus(SqlSessionTemplate sqlsession,int number);

	int memberReportStatusNoAllcount(SqlSessionTemplate sqlsession);

	ArrayList<Report> memberReportStatusNoAll(SqlSessionTemplate sqlsession, int page);

	int memberReportStatusYesAllcount(SqlSessionTemplate sqlsession);

	ArrayList<Report> memberReportStatusYesAll(SqlSessionTemplate sqlsession, int page);

	int memberReportSearchCount(SqlSessionTemplate sqlsession, String searchval, String searchcon);

	ArrayList<Report> memberReportSearch(SqlSessionTemplate sqlsession, int page, String searchval, String searchcon);

	int judgeMember(SqlSessionTemplate sqlsession,String judge,String userId);

	ArrayList<Report> memberReportAll(SqlSessionTemplate sqlsession, String searchval);

	int[] donateSearchIDAll(SqlSessionTemplate sqlsession, String searchval);

	int memberReturnRetire(SqlSessionTemplate sqlsession, String searchval);

	ArrayList<Calcul> calcul(SqlSessionTemplate sqlsession,String year);

	

}

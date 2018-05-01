package com.kh.forest.manager.model.dao;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.forest.common.Donate;
import com.kh.forest.common.Member;
import com.kh.forest.manager.model.vo.RankAgeByWriter;
import com.kh.forest.manager.model.vo.RankGender;
import com.kh.forest.manager.model.vo.Refund;
import com.kh.forest.manager.model.vo.Report;

import oracle.net.aso.s;

@Repository
public class ManagerDaoImpl implements ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlsession;

	class rank {
		String writer;
		int value;
	}

	@Override
	public ArrayList<Member> memberSerchAll(SqlSessionTemplate sqlsession, int page) {
		// TODO Auto-generated method stub
		ArrayList<Member> list = new ArrayList<Member>();

		list.addAll(sqlsession.selectList("Member.SearchMemberAll", page));

		System.out.println(list);
		return list;
	}

	@Override
	public ArrayList<Member> memberSerchOne(SqlSessionTemplate sqlsession, String searchval, String searchcon) {
		// TODO Auto-generated method stub
		ArrayList<Member> list = new ArrayList<Member>();

		switch (searchcon) {
		case "id":
			list.addAll(sqlsession.selectList("Member.SearchMemberOneId", searchval));
			break;
		case "name":
			list.addAll(sqlsession.selectList("Member.SearchMemberOneName", searchval));
			break;
		case "gender":
			list.addAll(sqlsession.selectList("Member.SearchMemberOneGender", searchval));
			break;

		default:
			break;
		}

		System.out.println(list);
		return list;
	}

	@Override
	public int[] chartGenderNum(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		int[] gender = new int[2];

		gender[0] = sqlsession.selectOne("Chart.CountMale");
		gender[1] = sqlsession.selectOne("Chart.CountFemale");

		return gender;
	}

	@Override
	public ArrayList<RankGender> rank3byGenderMale(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		ArrayList<RankGender> list = new ArrayList<RankGender>();
		list.addAll(sqlsession.selectList("Chart.rank3byMaleValue"));
		return list;
	}

	@Override
	public ArrayList<RankGender> rank3byGenderFemale(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		ArrayList<RankGender> list = new ArrayList<RankGender>();
		list.addAll(sqlsession.selectList("Chart.rank3byFemaleValue"));
		return list;
	}

	@Override
	public int[] chartAgeNum(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		int[] age = new int[6];

		age[0] = sqlsession.selectOne("Chart.CountAge10");
		age[1] = sqlsession.selectOne("Chart.CountAge20");
		age[2] = sqlsession.selectOne("Chart.CountAge30");
		age[3] = sqlsession.selectOne("Chart.CountAge40");
		age[4] = sqlsession.selectOne("Chart.CountAge50");
		age[5] = sqlsession.selectOne("Chart.CountAge60over");

		return age;

	}

	@Override
	public void memberUpdate(SqlSessionTemplate sqlsession, int mNo, String mPwd, String mPhone, String mEmail,
			String mLevel, String mNickName) {
		// TODO Auto-generated method stub
		Member member = new Member();
		member.setmNo(mNo);
		member.setmPwd(mPwd);
		member.setmPhone(mPhone);
		member.setmEmail(mEmail);
		member.setmLevel(mLevel);
		member.setmNickName(mNickName);
		int result = sqlsession.update("Member.MemberUpdate", member);
		System.out.println("업데이트 상태=" + result);
	}

	@Override
	public ArrayList<RankAgeByWriter> RankAgeByWriter10(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		ArrayList<RankAgeByWriter> list = new ArrayList<>();
		for (int i = 0; i < 5; i++) {
			RankAgeByWriter rabw = new RankAgeByWriter();
			rabw = sqlsession.selectOne("Chart.RankAge10ByWriter", i + 1);
			if (rabw.getAmount() == 0) {

				rabw.setAmount(0);
			}
			if (rabw.getCount() == 0) {

				rabw.setCount(0);
			}
			if (rabw.getRankId() == 0) {

				rabw.setRankId(0);
			}
			if (rabw.getWriter() == null) {

				rabw.setWriter("없음");
			}

			list.add(rabw);
		}

		return list;
	}

	@Override
	public ArrayList<Donate> donateSearchAll(SqlSessionTemplate sqlsession, int page) {
		// TODO Auto-generated method stub
		ArrayList<Donate> list = new ArrayList<>();
		list.addAll(sqlsession.selectList("Donate.DonateSelectAll", page));
		return list;
	}

	@Override
	public ArrayList<Donate> donateSearchTOne(SqlSessionTemplate sqlsession, String searchval, int page) {
		// TODO Auto-generated method stub
		ArrayList<Donate> list = new ArrayList<>();
		list.addAll(sqlsession.selectList("Donate.DonateSelectTOne", searchval));
		System.out.println(list);
		return list;
	}

	@Override
	public ArrayList<Donate> donateSearchTSum(SqlSessionTemplate sqlsession, String searchval) {
		// TODO Auto-generated method stub
		ArrayList<Donate> list = new ArrayList<>();
		list.addAll(sqlsession.selectList("Donate.DonateSelectTSum", searchval));
		System.out.println(list);
		return list;
	}

	@Override
	public ArrayList<Donate> donateSearchGOne(SqlSessionTemplate sqlsession, String searchval, int page) {
		// TODO Auto-generated method stub
		ArrayList<Donate> list = new ArrayList<>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchval", searchval);
		map.put("page", page);
		list.addAll(sqlsession.selectList("Donate.DonateSelectGOne", map));
		System.out.println(list);
		return list;
	}

	@Override
	public ArrayList<Donate> donateSearchGSum(SqlSessionTemplate sqlsession, String searchval) {
		// TODO Auto-generated method stub
		ArrayList<Donate> list = new ArrayList<>();
		list.addAll(sqlsession.selectList("Donate.DonateSelectGSum", searchval));
		System.out.println(list);
		return list;
	}

	@Override
	public int countdonation() {
		// TODO Auto-generated method stub
		int count = sqlsession.selectOne("Donate.CountDonation");
		return count;
	}

	@Override
	public int CountdonateSearch(SqlSessionTemplate sqlsession, String searchcon, String searchval) {
		// TODO Auto-generated method stub
		int count = 0;

		switch (searchcon) {
		case "gname":
			count = sqlsession.selectOne("Donate.CountDonateSelectGOne", searchval);
			break;

		case "tname":
			count = sqlsession.selectOne("Donate.CountDonateSelectTOne", searchval);
			break;

		default:
			break;
		}
		return count;
	}

	@Override
	public int countMemberAll(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		int count = sqlsession.selectOne("Member.CountMemeber");
		return count;
	}

	@Override
	public int CountAccount(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		int count = sqlsession.selectOne("Account.countRownum");
		return count;
	}

	@Override
	public ArrayList<Donate> AccountSearchAll(int page) {
		// TODO Auto-generated method stub
		ArrayList<Donate> list = new ArrayList<Donate>();
		list.addAll(sqlsession.selectList("Account.SelectAccountAll", page));
		return list;
	}

	@Override
	public ArrayList<Donate> AccountSearch(String searchcon, String searchval) {
		// TODO Auto-generated method stub
		ArrayList<Donate> list = new ArrayList<Donate>();
		System.out.println(searchcon + searchval);
		switch (searchcon) {
		case "birth":
			list.addAll(sqlsession.selectList("Account.SelectAccountbirth", searchval));
			break;

		case "username":
			list.addAll(sqlsession.selectList("Account.SelectAccountName", searchval));
			break;
		}
		System.out.println(list);
		return list;
	}

	@Override
	public int CountNotRefund(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		int count = sqlsession.selectOne("Refund.CountNotRefund");
		return count;
	}

	@Override
	public int CountRefund(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		int count = sqlsession.selectOne("Refund.CountRefund");
		return count;
	}

	@Override
	public ArrayList<Refund> SearchNotRefundAll(SqlSessionTemplate sqlsession, int page) {
		// TODO Auto-generated method stub
		ArrayList<Refund> list = new ArrayList<>();
		list.addAll(sqlsession.selectList("Refund.NotRefundSearchAll", page));
		return list;
	}

	@Override
	public ArrayList<Refund> SearchRefundAll(SqlSessionTemplate sqlsession, int page) {
		// TODO Auto-generated method stub
		ArrayList<Refund> list = new ArrayList<>();
		list.addAll(sqlsession.selectList("Refund.RefundSearchAll", page));
		return list;
	}

	@Override
	public int CountSearchRefund(SqlSessionTemplate sqlsession, String searchval) {
		// TODO Auto-generated method stub
		int count = sqlsession.selectOne("Refund.CountSearchRefund", searchval);
		return count;
	}

	@Override
	public ArrayList<Refund> SearchRefund(SqlSessionTemplate sqlsession, int page, String searchval) {
		// TODO Auto-generated method stub
		ArrayList<Refund> list = new ArrayList<>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchval", searchval);
		map.put("page", page);
		list.addAll(sqlsession.selectList("Refund.SearchRefund", map));
		return list;
	}

	@Override
	public int UpdateRefundStatus(SqlSessionTemplate sqlsession, int number) {
		// TODO Auto-generated method stub
		int result = sqlsession.selectOne("Refund.UpdateRefundStatus", number);
		return result;
	}

	@Override
	public int memberReportStatusNoAllcount(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		int count = sqlsession.selectOne("Member.CountReportStatusNo");
		return count;
	}

	@Override
	public ArrayList<Report> memberReportStatusNoAll(SqlSessionTemplate sqlsession, int page) {
		// TODO Auto-generated method stub
		ArrayList<Report> list = new ArrayList<>();
		list.addAll(sqlsession.selectList("Member.ReportSearchStatusNoAll", page));
		return list;
	}

	@Override
	public int memberReportStatusYesAllcount(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		int count = sqlsession.selectOne("Member.CountReportStatusYes");
		return count;
	}

	@Override
	public ArrayList<Report> memberReportStatusYesAll(SqlSessionTemplate sqlsession, int page) {
		// TODO Auto-generated method stub
		ArrayList<Report> list = new ArrayList<>();
		list.addAll(sqlsession.selectList("Member.ReportSearchStatusYesAll", page));
		return list;
	}

	@Override
	public int memberReportSearchCount(SqlSessionTemplate sqlsession, String searchval, String searchcon) {
		// TODO Auto-generated method stub
		int count = 0;
		switch (searchcon) {
		case "id":
			count = sqlsession.selectOne("Member.CountReportSearchId",searchval);
			break;

		case "reason":
			count = sqlsession.selectOne("Member.CountReportSearchReason",searchval);
			break;
		}

		return count;

	}

	@Override
	public ArrayList<Report> memberReportSearch(SqlSessionTemplate sqlsession, int page, String searchval,
			String searchcon) {
		// TODO Auto-generated method stub
		ArrayList<Report> list = new ArrayList<>();
		
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("searchval", searchval);
		map.put("page",page);
		switch (searchcon) {
		case "id":
			list.addAll(sqlsession.selectList("Member.ReportSearchId",map));
			break;

		case "reason":
			list.addAll(sqlsession.selectList("Member.ReportSearchReason",map));
			break;
		}

		return list;
	}

	@Override
	public int judgeMember(SqlSessionTemplate sqlsession,String judge,String userId) {
		// TODO Auto-generated method stub
		int result=0;
		int resout1=0,resout2=0;
		
		System.out.println(userId+judge);
		switch (judge)
		{
		case "warning":
			result=sqlsession.update("Member.judgeMemberWarning",userId);
			break;

		case "out":
			resout1=sqlsession.update("Member.judgeMemberOut1",userId);
			resout2=sqlsession.update("Member.setMemberStatusN",userId);
			result=resout1*resout2;
			break;
		}
		
		return result;
	}

	@Override
	public ArrayList<Report> memberReportAll(SqlSessionTemplate sqlsession, String searchval) {
		// TODO Auto-generated method stub
		ArrayList<Report>list=new ArrayList<>();
		list.addAll(sqlsession.selectList("Member.ReportSearchIdAll",searchval));
		return list;
	}

	@Override
	public int[] donateSearchIDAll(SqlSessionTemplate sqlsession, String searchval) {
		// TODO Auto-generated method stub
		int[] list = new int[4];
		 list[0]=sqlsession.selectOne("Donate.CountDonateSelectGOne",searchval);
		 list[1]=sqlsession.selectOne("Donate.DonateSelectGAmount",searchval);
		 list[2]=sqlsession.selectOne("Donate.CountDonateSelectTOne",searchval);
		 list[3]=sqlsession.selectOne("Donate.DonateSelectTAmount",searchval);
		 return list;
	}

	@Override
	public int memberReturnRetire(SqlSessionTemplate sqlsession, String searchval) {
		// TODO Auto-generated method stub
		int result=0;
		String status=sqlsession.selectOne("Member.getMemberStatus",searchval);
		switch (status) {
		case "Y":
			result=sqlsession.update("Member.setMemberStatusN",searchval);
			break;

		case "N":
			result=sqlsession.update("Member.setMemberStatusY",searchval);
			break;

		}
		return result;
	}

}

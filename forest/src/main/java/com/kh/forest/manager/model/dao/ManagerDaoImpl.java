package com.kh.forest.manager.model.dao;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.forest.common.Member;
import com.kh.forest.manager.model.vo.RankGender;

@Repository
public class ManagerDaoImpl implements ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlsession;

	class rank {
		String writer;
		int value;
	}

	@Override
	public ArrayList<Member> memberSerchAll(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
		ArrayList<Member> list = new ArrayList<Member>();

		list.addAll(sqlsession.selectList("Member.SearchMemberAll"));

		System.out.println(list);
		return list;
	}

	@Override
	public ArrayList<Member> memberSerchOne(SqlSessionTemplate sqlsession, String searchval, String searchcon) {
		// TODO Auto-generated method stub
		ArrayList<Member> list = new ArrayList<Member>();
		Member member = null;

		int count = sqlsession.selectOne("Member.CountMemeber");
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
	public void memberUpdate(SqlSessionTemplate sqlsession,int mNo, String mPwd, String mPhone, String mEmail, String mLevel,
			String mNickName) {
		// TODO Auto-generated method stub
		Member member=new Member();
		member.setmNo(mNo);
		member.setmPwd(mPwd);
		member.setmPhone(mPhone);
		member.setmEmail(mEmail);
		member.setmLevel(mLevel);
		member.setmNickName(mNickName);
		int result=sqlsession.update("Member.MemberUpdate",member);
		System.out.println("업데이트 상태="+result);
	}

}

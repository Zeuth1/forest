package com.kh.forest.manager.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forest.manager.model.dao.A_MemberDao;
import com.kh.forest.manager.model.vo.Mem;


@Service
public class AdminServiceImpl implements AdminService{
@Autowired
private A_MemberDao amd;
	@Override
	public ArrayList<Mem> a_memberSerchAll() {
		// TODO Auto-generated method stub
		ArrayList<Mem>list=amd.a_memberSerchAll();
		return null;
	}

}

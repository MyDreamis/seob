package com.camp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.dao.MemberDAO;
import com.camp.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;

	@Override
	public void insertMember(MemberVO m) {
		this.memberDao.insertMember(m);
		
	}

	@Override
	public MemberVO idCheck(String id) {
		return this.memberDao.idCheck(id);
	}

	@Override
	public MemberVO login_ok(String id) {
		return this.memberDao.login_ok(id);
	}
}

package com.camp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVO m) {
		this.sqlSession.insert("m_insert",m);
		
	}

	@Override
	public MemberVO idCheck(String id) {
	
		return this.sqlSession.selectOne("m_idCheck",id);
	}

	@Override
	public MemberVO login_ok(String id) {
		return this.sqlSession.selectOne("m_login",id);
	}
}

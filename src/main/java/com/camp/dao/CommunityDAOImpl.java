package com.camp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.vo.CommunityVO;
import com.camp.vo.MemberVO;
import com.camp.vo.ReplyVO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertCm(CommunityVO cm) {
		
		this.sqlSession.insert("c_insert",cm);
		
	}

	@Override
	public CommunityVO getCCont(int c_no) {

		return this.sqlSession.selectOne("c_co",c_no);
	}
	
	@Override
	public int getListCount(CommunityVO m) {

		return this.sqlSession.selectOne("c_count",m);
	}

	@Override
	public List<CommunityVO> getCommunityList(CommunityVO m) {
		return this.sqlSession.selectList("c_list",m);
	}

	@Override
	public void editCm(CommunityVO cm) {
		this.sqlSession.update("c_edit",cm);
		
	}

	@Override
	public void updateHit(int c_no) {
		this.sqlSession.update("c_hit",c_no);
		
	}

	@Override
	public void delCm(int c_no) {
		this.sqlSession.delete("c_del",c_no);
		
	}

	@Override
	public List<CommunityVO> CommunityList(CommunityVO c) {
		return this.sqlSession.selectList("m_list",c);
	}
}

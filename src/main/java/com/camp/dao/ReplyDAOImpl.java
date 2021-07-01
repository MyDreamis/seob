package com.camp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.vo.ReplyVO;


@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<ReplyVO> rlist(int c_no) {
		
		return this.sqlSession.selectList("r_list",c_no);
	}

	@Override
	public void replyUpdate(ReplyVO r) {

		this.sqlSession.update("r_update",r);
	}

	@Override
	public void delete(int r_no) {
	
		this.sqlSession.delete("r_del",r_no);
	}

	@Override
	public int count(int c_no) {
	
		return 0;
	}

	@Override
	public void insertRe(ReplyVO r) {
		this.sqlSession.insert("r_insert",r);
		
	}

}

package com.camp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.dao.ReplyDAO;
import com.camp.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDao;
	
	@Override
	public List<ReplyVO> rlist(int c_no) {
		
		return this.replyDao.rlist(c_no);
	}

	@Override
	public void replyUpdate(ReplyVO r) {
		this.replyDao.replyUpdate(r);
	}

	@Override
	public void delete(int r_no) {
		this.replyDao.delete(r_no);
	}

	@Override
	public int count(int c_no) {
		return 0;
	}

	@Override
	public void insertRe(ReplyVO r) {
		this.replyDao.insertRe(r);
		
	}

}

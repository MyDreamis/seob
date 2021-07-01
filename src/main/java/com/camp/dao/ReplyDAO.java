package com.camp.dao;

import java.util.List;

import com.camp.vo.ReplyVO;

public interface ReplyDAO {

	void replyUpdate(ReplyVO r);

	void delete(int r_no);

	List<ReplyVO> rlist(int c_no);
	
	int count(int c_no);

	void insertRe(ReplyVO r);

}

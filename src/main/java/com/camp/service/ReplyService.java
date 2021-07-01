package com.camp.service;

import java.util.List;

import com.camp.vo.ReplyVO;

public interface ReplyService {
	

	void replyUpdate(ReplyVO r);

	void delete(int r_no);

	List<ReplyVO> rlist(int c_no);
	
	int count(int c_no);

	void insertRe(ReplyVO r);

}

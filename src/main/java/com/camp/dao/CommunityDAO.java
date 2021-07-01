package com.camp.dao;

import java.util.List;

import com.camp.vo.CommunityVO;
import com.camp.vo.MemberVO;
import com.camp.vo.ReplyVO;

public interface CommunityDAO {

	void insertCm(CommunityVO cm);

	CommunityVO getCCont(int c_no);

	int getListCount(CommunityVO m);

	List<CommunityVO> getCommunityList(CommunityVO m);

	void editCm(CommunityVO cm);

	void updateHit(int c_no);

	void delCm(int c_no);

	List<CommunityVO> CommunityList(CommunityVO c);
	
	
}

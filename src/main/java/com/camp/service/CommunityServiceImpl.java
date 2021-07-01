package com.camp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.camp.dao.CommunityDAO;
import com.camp.vo.CommunityVO;
import com.camp.vo.ReplyVO;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDAO communityDao;

	@Override
	public void insertCm(CommunityVO cm) {
		this.communityDao.insertCm(cm);
		
	}
	@Transactional
	@Override
	public CommunityVO getCCont(int c_no) {
	
		return this.communityDao.getCCont(c_no);
	}

	@Override
	public int getListCount(CommunityVO m) {
		
		return this.communityDao.getListCount(m);
	}

	@Override
	public List<CommunityVO> getCommunityList(CommunityVO m) {
		return this.communityDao.getCommunityList(m);
	}

	@Override
	public void editCm(CommunityVO cm) {
		this.communityDao.editCm(cm);
		
	}
	@Override
	public void updateHit(int c_no) {
		this.communityDao.updateHit(c_no);
		
	}
	@Override
	public void delCm(int c_no) {
		this.communityDao.delCm(c_no);
		
	}
	@Override
	public List<CommunityVO> CommunityList(CommunityVO c) {
		return this.communityDao.CommunityList(c);
	}

}

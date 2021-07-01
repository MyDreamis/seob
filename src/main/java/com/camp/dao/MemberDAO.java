package com.camp.dao;

import com.camp.vo.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO m);

	MemberVO idCheck(String id);

	MemberVO login_ok(String id);

}

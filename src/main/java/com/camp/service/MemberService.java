package com.camp.service;

import com.camp.vo.MemberVO;

public interface MemberService {

	void insertMember(MemberVO m);

	MemberVO idCheck(String id);

	MemberVO login_ok(String id);

}

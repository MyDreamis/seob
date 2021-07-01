package com.camp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyStoryDAOImpl implements MyStoryDAO {

	@Autowired
	private SqlSession sqlSession;
}

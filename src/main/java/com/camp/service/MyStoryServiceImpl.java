package com.camp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.dao.MyStoryDAO;

@Service
public class MyStoryServiceImpl implements MyStoryService {

	@Autowired
	private MyStoryDAO	myStoryDao;
}

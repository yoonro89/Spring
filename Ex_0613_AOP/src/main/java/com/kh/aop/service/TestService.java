package com.kh.aop.service;

import com.kh.aop.dao.TestDAO;

public class TestService {

	TestDAO test_dao;
	public void setTest_dao(TestDAO test_dao) {
		this.test_dao = test_dao;
	}
	
	public void test() {
		System.out.println("-- call TestService.test() --");
		try {
			Thread.sleep(1000);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
}

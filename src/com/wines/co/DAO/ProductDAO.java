package com.wines.co.DAO;

import org.apache.ibatis.session.SqlSession;

import config.mybatis.DBService;

public class ProductDAO {
	
	private static SqlSession sqlSession;
	
	private synchronized static SqlSession getSqlSession() {
		if (sqlSession == null) {
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
}

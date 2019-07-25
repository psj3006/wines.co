package com.wines.co;

import org.apache.ibatis.session.SqlSession;

public class DAO {

	private static SqlSession sqlSession;
	
	private synchronized static SqlSession getSqlSession() {
		if (sqlSession == null) {
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
	
	
}

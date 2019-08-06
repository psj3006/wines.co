package com.wines.co.DAO;

import org.apache.ibatis.session.SqlSession;

import com.wines.co.VO.CartVO;

import config.mybatis.DBService;

public class CartDAO {
private static SqlSession sqlSession;
	
	private synchronized static SqlSession getSqlSession() {
		if (sqlSession == null) {
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
	
	public static int addCart(CartVO cvo) {
		int result = getSqlSession().insert("add_cart", cvo);
		getSqlSession().commit();
		return result;
	}
}

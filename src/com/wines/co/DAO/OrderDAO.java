package com.wines.co.DAO;

import org.apache.ibatis.session.SqlSession;

import com.wines.co.VO.OrderVO;
import com.wines.co.service.DBService;

public class OrderDAO {
	private static SqlSession sqlSession;
	
	private synchronized static SqlSession getSqlSession() {
		if (sqlSession == null) {
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
 	}
	public static int addOrder(OrderVO ovo) {
		int result = getSqlSession().insert("add_order", ovo);
		getSqlSession().commit();
		return result;
	}
	public static int getNextval() {
		int nextval = getSqlSession().selectOne("get_nextval");
		return nextval;
	}
}

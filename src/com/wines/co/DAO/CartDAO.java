package com.wines.co.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wines.co.VO.CartVO;
import com.wines.co.service.DBService;

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
	public static List<CartVO> getCart(String id) {
		return getSqlSession().selectList("select_cart", id);
	}
	public static int deleteCart(int c_num) {
		int result = getSqlSession().delete("delete_cart", c_num);
		getSqlSession().commit();
		return result;
	}
	public static int deleteCartById(String id) {
		int result = getSqlSession().delete("delete_cart_by_id", id);
		getSqlSession().commit();
		return result;
	}
}

package com.wines.co.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wines.co.VO.ProductVO;

import config.mybatis.DBService;

public class ProductDAO {
	
	private static SqlSession sqlSession;
	
	private synchronized static SqlSession getSqlSession() {
		if (sqlSession == null) {
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
	public static List<ProductVO> getAllProducts() {
		return getSqlSession().selectList("select_all_products");
	}
	public static int addProduct(ProductVO pvo) {
		int result = getSqlSession().insert("add_product", pvo);
		getSqlSession().commit();
		return result;
	}
}

package com.wines.co.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wines.co.VO.ProductVO;
import com.wines.co.service.DBService;

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
	public static ProductVO getOneProduct(int p_num) {
		return getSqlSession().selectOne("select_one_product", p_num);
	}
	public static int updateProduct(ProductVO pvo) {
		int result = getSqlSession().update("update_product", pvo);
		getSqlSession().commit();
		return result;
	}
	public static int deleteProduct(int p_num) {
		int result = getSqlSession().delete("delete_product", p_num);
		getSqlSession().commit();
		return result;
	}
}

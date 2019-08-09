package com.wines.co.DAO;

import java.util.List;

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
	public static List<Integer> getO_numbers(String id) {
		return getSqlSession().selectList("get_o_numbers", id);
	}
	public static OrderVO getOrderInfoByO_num(int o_num) {
		return getSqlSession().selectOne("get_order_info", o_num);
	}
	public static int getCountOfOrders(int o_num) {
		return getSqlSession().selectOne("get_count", o_num);
	}
	public static List<OrderVO> getAllListByO_num(int o_num) {
		return getSqlSession().selectList("get_all_list", o_num);
	}
}

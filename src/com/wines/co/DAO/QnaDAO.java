package com.wines.co.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wines.co.VO.QnaVO;
import com.wines.co.service.DBService;


public class QnaDAO {

	private static SqlSession sqlSession;
		
	private synchronized static SqlSession getSqlSession() {
		if (sqlSession == null) {
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
	
	public static List<QnaVO> getAllList() {
		return getSqlSession().selectList("select_all_list");
	}
}

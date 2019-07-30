package com.wines.co;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class DAO {

	private static SqlSession sqlSession;
	
	private synchronized static SqlSession getSqlSession() {
		if (sqlSession == null) {
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
	
	public static List<MVO> getAllMembers() {
		return getSqlSession().selectList("select_all_members");
	}
	
	public static MVO getOneMember(String id) {
		return getSqlSession().selectOne("select_one_member", id);
	}
	
	public static int signUp(MVO mvo) {
		int result = getSqlSession().insert("sign_up", mvo);
		getSqlSession().commit();
		return result;
	}
	
	public static int updateMember(MVO mvo) {
		int result = getSqlSession().update("update_member", mvo);
		getSqlSession().commit();
		return result;
	}
	
}

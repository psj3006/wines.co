package com.wines.co.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wines.co.VO.MemberVO;
import com.wines.co.service.DBService;

public class MemberDAO {

	private static SqlSession sqlSession;
	
	private synchronized static SqlSession getSqlSession() {
		if (sqlSession == null) {
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
	
	public static List<MemberVO> getAllMembers() {
		return getSqlSession().selectList("select_all_members");
	}
	
	public static MemberVO getOneMember(String id) {
		return getSqlSession().selectOne("select_one_member", id);
	}
	
	public static int signUp(MemberVO mvo) {
		int result = getSqlSession().insert("sign_up", mvo);
		getSqlSession().commit();
		return result;
	}
	
	public static int updateMember(MemberVO mvo) {
		int result = getSqlSession().update("update_member", mvo);
		getSqlSession().commit();
		return result;
	}
	
	public static int deleteMember(String mvo) {
		int result = getSqlSession().delete("delete_member", mvo);
		getSqlSession().commit();
		return result;
	}
}

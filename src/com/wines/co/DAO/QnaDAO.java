package com.wines.co.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.wines.co.VO.CommentVO;
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
	
	public static List<QnaVO> getList(Map<String, Integer> map) {
		return getSqlSession().selectList("select_all_list", map);
	}
	public static int getTotalRecordCount() {
		return getSqlSession().selectOne("totalRecordCount");
	}
	
	public static int writeQna(QnaVO qvo) {
		int result = getSqlSession().insert("write_qna", qvo);
		getSqlSession().commit();
		return result;
	}
	
	public static QnaVO getOneList(int q_num) {
		return getSqlSession().selectOne("select_one_list", q_num);
	}
	
	public static int incrementHit(QnaVO qvo) {
		int result = getSqlSession().update("increment_hit", qvo);
		getSqlSession().commit();
		return result;
	}
	
	public static List<CommentVO> getCommentList(int q_num) {
		return getSqlSession().selectList("select_comment_list", q_num);
	}
	
	public static int deleteComment(int com_num) {
		int result = getSqlSession().delete("delete_comment", com_num);
		getSqlSession().commit();
		return result;
	}

	public static int WriteComment(CommentVO cvo) {
		int result = getSqlSession().insert("write_comment", cvo);
		getSqlSession().commit();
		return result;
	}
	
	public static int updateQna(QnaVO qvo) {
		int result = getSqlSession().update("update_qna", qvo);
		getSqlSession().commit();
		return result;
	}
	
	public static int deleteQna(int q_num) {
		int result = getSqlSession().delete("delete_qna", q_num);
		getSqlSession().commit();
		return result;
	}
	
	public static List<QnaVO> selectAllById(String id) {
		return getSqlSession().selectList("select_all_by_id", id);
	}
}

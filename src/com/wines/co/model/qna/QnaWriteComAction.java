package com.wines.co.model.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.DAO.QnaDAO;
import com.wines.co.VO.CommentVO;

public class QnaWriteComAction implements QnaAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		String com_content = request.getParameter("com_content");
		
		CommentVO cvo = new CommentVO(q_num, id, com_content);
		
		int result = QnaDAO.WriteComment(cvo);
		if (result>0 ) {
			return "QController?type=qna_view_noHit&q_num=" + q_num;
		} else {
			return "QController";
		}
	}

}

package com.wines.co.model.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.DAO.QnaDAO;

public class QnaDeleteComAction implements QnaAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		int com_num = Integer.parseInt(request.getParameter("com_num"));
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		
		int result = QnaDAO.deleteComment(com_num);
		if (result>0) {
			return "QController?type=qna_view_noHit&q_num=" + q_num;
		} else {
			return "QController";
		}
		
	}

}

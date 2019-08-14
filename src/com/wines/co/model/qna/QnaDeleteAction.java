package com.wines.co.model.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.DAO.QnaDAO;

public class QnaDeleteAction implements QnaAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		int q_num = Integer.parseInt(request.getParameter("q_num"));
		
		int result = QnaDAO.deleteQna(q_num);
		if (result>0) {
			return "QController?type=goQna";
		} else {
			return "QController";
		}
		
	}

}

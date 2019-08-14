package com.wines.co.model.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wines.co.DAO.QnaDAO;
import com.wines.co.VO.MemberVO;
import com.wines.co.VO.QnaVO;

public class QnaUpdateAction implements QnaAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		QnaVO qvo = new QnaVO();
		qvo.setSubject(subject);
		qvo.setContent(content);
		qvo.setQ_num(q_num);
		
		int result = QnaDAO.updateQna(qvo);
		if (result>0) {
			return "QController?type=qna_view_noHit&q_num=" + q_num;
		} else {
			return "QController";
		}
		
	}
	
}

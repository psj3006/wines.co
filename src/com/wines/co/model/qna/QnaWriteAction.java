package com.wines.co.model.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wines.co.DAO.QnaDAO;
import com.wines.co.VO.MemberVO;
import com.wines.co.VO.QnaVO;

public class QnaWriteAction implements QnaAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String id = mvo.getId();
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		QnaVO qvo = new QnaVO(id, subject, content);
		
		int result = QnaDAO.writeQna(qvo);
		if (result>0) {
			return "QController?type=goQna";
		} else {
			return "QController";
		}
	}

}

package com.wines.co.model.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wines.co.DAO.QnaDAO;
import com.wines.co.VO.CommentVO;
import com.wines.co.VO.QnaVO;

public class QnaViewNoIncHitAction implements QnaAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		String nowPage = request.getParameter("nowPage");
		
		QnaVO qvo = QnaDAO.getOneList(q_num);
		HttpSession session = request.getSession();
		session.setAttribute("qvo", qvo);
		
		List<CommentVO> cList = QnaDAO.getCommentList(q_num);

		request.setAttribute("cList", cList);
		
		request.setAttribute("nowPage", nowPage);
		
		return "qna_view.jsp";
		
	}

}
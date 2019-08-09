package com.wines.co.model.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.DAO.QnaDAO;
import com.wines.co.VO.QnaVO;

public class GoQnaPageAction implements QnaAction{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		List<QnaVO> list = QnaDAO.getAllList();
		request.setAttribute("list", list);
		return "qna_page.jsp";
	}
}

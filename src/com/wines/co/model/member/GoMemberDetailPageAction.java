package com.wines.co.model.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.DAO.OrderDAO;
import com.wines.co.DAO.QnaDAO;
import com.wines.co.VO.QnaVO;


public class GoMemberDetailPageAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		List<Integer> o_list = OrderDAO.getO_numbers(id);
		
		request.setAttribute("o_list", o_list);
		request.setAttribute("id", id);
		
		List<QnaVO> qvo = QnaDAO.selectAllById(id);
		request.setAttribute("qvo", qvo);
		
		return "manage_member_detail.jsp";
	}
}

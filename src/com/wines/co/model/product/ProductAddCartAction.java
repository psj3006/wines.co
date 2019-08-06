package com.wines.co.model.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wines.co.DAO.CartDAO;
import com.wines.co.VO.CartVO;
import com.wines.co.VO.MemberVO;

public class ProductAddCartAction implements ProductAction{
	
	

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String id = mvo.getId();
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		CartVO cvo = new CartVO(id, p_num, amount);
		int result = CartDAO.addCart(cvo);
		
		if (result>0) {
			return "product_view_cart.jsp";
		} else {
			// 기본타입이 error 이므로 에러페이지 이동
			return "PController";
		}
	}
	
}

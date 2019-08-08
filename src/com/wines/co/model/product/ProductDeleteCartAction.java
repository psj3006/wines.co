package com.wines.co.model.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.DAO.CartDAO;

public class ProductDeleteCartAction implements ProductAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		int c_num = Integer.parseInt(request.getParameter("c_num"));
		
		int result = CartDAO.deleteCart(c_num);
		if (result>0) {
			return "product_view_cart.jsp";
		} else {
			// 기본타입이 error 이므로 에러페이지 이동
			return "PController";
		}
		
	}

}

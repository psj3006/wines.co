package com.wines.co.model.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.DAO.ProductDAO;

public class ProductDeleteAction implements ProductAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String p_num = request.getParameter("p_num");
		
		int result = ProductDAO.deleteProduct(p_num);
		if (result>0) {
			return "product_view_all.jsp";
		} else {
			// 기본타입이 error 이므로 에러페이지 이동
			return "PController";
		}
	}

}

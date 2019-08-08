package com.wines.co.model.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wines.co.DAO.CartDAO;
import com.wines.co.DAO.OrderDAO;
import com.wines.co.VO.CartVO;
import com.wines.co.VO.MemberVO;
import com.wines.co.VO.OrderVO;

public class ProductAddOrderAction implements ProductAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String id = mvo.getId();
		String o_name = request.getParameter("o_name");
		String o_addr = request.getParameter("o_addr");
		String o_tel = request.getParameter("o_tel");
		int totalprice = Integer.parseInt(request.getParameter("totalprice"));
		List<CartVO> cvo = CartDAO.getCart(id);
		
		// 한번 주문시에 하나의 sequence 값만을 사용해서 같은 주문임을 알 수 있게 함.
		
		// getNextval() 메소드를 이용해 다음 sequence값을 가져옴
		int o_num = OrderDAO.getNextval();
		
		int i = 0;
		int totalresult = 0;
		int result = 0;
		// order_t 테이블에 데이터추가
		for (i=0; i<cvo.size(); i++) {
			OrderVO ovo = new OrderVO(id, o_name, o_addr, o_tel, totalprice, cvo.get(i).getP_num(), cvo.get(i).getAmount());
			// 위에서 가져온 sequence 값을 setter를 이용해 직접 넣어줌
			ovo.setO_num(o_num);
			result = OrderDAO.addOrder(ovo);
			totalresult += result;
			result = 0;
		}
		// cart 테이블에서 데이터제거
		result = CartDAO.deleteCartById(id);
		totalresult += result;
		
		if (totalresult>i) {
			return "product_view_order.jsp";
		} else {
			// 기본타입이 error 이므로 에러페이지 이동
			return "PController";
		}
	}

}

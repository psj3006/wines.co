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
		
		// �ѹ� �ֹ��ÿ� �ϳ��� sequence ������ ����ؼ� ���� �ֹ����� �� �� �ְ� ��.
		
		// getNextval() �޼ҵ带 �̿��� ���� sequence���� ������
		int o_num = OrderDAO.getNextval();
		
		int i = 0;
		int totalresult = 0;
		int result = 0;
		// order_t ���̺� �������߰�
		for (i=0; i<cvo.size(); i++) {
			OrderVO ovo = new OrderVO(id, o_name, o_addr, o_tel, totalprice, cvo.get(i).getP_num(), cvo.get(i).getAmount());
			// ������ ������ sequence ���� setter�� �̿��� ���� �־���
			ovo.setO_num(o_num);
			result = OrderDAO.addOrder(ovo);
			totalresult += result;
			result = 0;
		}
		// cart ���̺��� ����������
		result = CartDAO.deleteCartById(id);
		totalresult += result;
		
		if (totalresult>i) {
			return "product_view_order.jsp";
		} else {
			// �⺻Ÿ���� error �̹Ƿ� ���������� �̵�
			return "PController";
		}
	}

}

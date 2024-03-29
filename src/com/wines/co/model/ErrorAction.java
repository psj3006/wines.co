package com.wines.co.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.model.member.MemberAction;
import com.wines.co.model.product.ProductAction;
import com.wines.co.model.qna.QnaAction;

public class ErrorAction implements MemberAction, ProductAction, QnaAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		return "error_page.jsp";
	}

}

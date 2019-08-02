package com.wines.co.model.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ProductAction {

	public String process(HttpServletRequest request, HttpServletResponse response);
	
}

package com.wines.co.model.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface QnaAction {

	public String process(HttpServletRequest request, HttpServletResponse response);	
	
}

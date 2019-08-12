package com.wines.co.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.model.ErrorAction;
import com.wines.co.model.qna.GoQnaPageAction;
import com.wines.co.model.qna.QnaAction;
import com.wines.co.model.qna.QnaViewAction;
import com.wines.co.model.qna.QnaWriteAction;

@WebServlet("/QController")
public class QController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html); charset=utf-8");
		
		String type = "error";
		String param_type = request.getParameter("type");
		if (param_type != null && !param_type.isEmpty() ) {
			type = param_type;
		}
		
		QnaAction qnaAction = null;
		if (type.equals("error")) {
			qnaAction = new ErrorAction();
		} else if (type.equals("goQna")) {
			qnaAction = new GoQnaPageAction();
		} else if (type.equals("write")) {
			qnaAction = new QnaWriteAction();
		} else if (type.equals("qna_view")) {
			qnaAction = new QnaViewAction();
		} 

		String path = qnaAction.process(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

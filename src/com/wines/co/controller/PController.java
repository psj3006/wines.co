package com.wines.co.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.model.ErrorAction;
import com.wines.co.model.GoMainAction;
import com.wines.co.model.product.ProductAction;
import com.wines.co.model.product.ProductAddAction;
import com.wines.co.model.product.ProductAddCartAction;
import com.wines.co.model.product.ProductAddOrderAction;
import com.wines.co.model.product.ProductDeleteAction;
import com.wines.co.model.product.ProductDeleteCartAction;
import com.wines.co.model.product.ProductUpdateAction;

@WebServlet("/PController")
public class PController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String type = "error";
		String param_type = request.getParameter("type");
		if (param_type != null && !param_type.isEmpty() ) {
			type = param_type;
		}
		
		ProductAction productAction = null;
		if (type.equals("error")) {
			productAction = new ErrorAction();
		} else if (type.equals("goMain")) {
			productAction = new GoMainAction();
		} else if (type.equals("add")) {
			productAction = new ProductAddAction();
		} else if (type.equals("update")) {
			productAction = new ProductUpdateAction();
		} else if (type.equals("delete")) {
			productAction = new ProductDeleteAction();
		} else if (type.equals("addCart")) {
			productAction = new ProductAddCartAction();
		} else if (type.equals("deleteCart")) {
			productAction = new ProductDeleteCartAction();
		} else if (type.equals("addOrder")) {
			productAction = new ProductAddOrderAction();
		}
		String path = productAction.process(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

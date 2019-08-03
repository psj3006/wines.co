package com.wines.co.model.product;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wines.co.DAO.ProductDAO;
import com.wines.co.VO.ProductVO;

public class ProductAddAction implements ProductAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String Path = request.getServletContext().getRealPath("/images");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(
					request,				
					Path,				
					1024 * 1024 * 5,		
					"utf-8",				
					new DefaultFileRenamePolicy()	
					);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String p_name = mr.getParameter("p_name");
		String p_content = mr.getParameter("p_content");
		String p_price = mr.getParameter("p_price");
		String p_saleprice = mr.getParameter("p_saleprice");
		
		ProductVO pvo = new ProductVO();
		pvo.setP_name(p_name);
		pvo.setP_content(p_content);
		pvo.setP_price(p_price);
		pvo.setP_saleprice(p_saleprice);
		if (mr.getFilesystemName("p_image") != null) {
			pvo.setP_image(mr.getFilesystemName("p_image"));
		} else {
			pvo.setP_image("");
		}
		int result = ProductDAO.addProduct(pvo);
		if (result>0) {
			return "management.jsp";
		} else {
			// 기본타입이 error 이므로 에러페이지 이동
			return "PController";
		}
	}

}

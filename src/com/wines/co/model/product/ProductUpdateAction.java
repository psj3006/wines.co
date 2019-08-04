package com.wines.co.model.product;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wines.co.DAO.ProductDAO;
import com.wines.co.VO.ProductVO;

public class ProductUpdateAction implements ProductAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String realPath = request.getServletContext().getRealPath("/images");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(
						request,
						realPath,
						1024 * 1024 * 10,
						"utf-8",
						new DefaultFileRenamePolicy()
					);
		} catch (IOException e) {
			e.printStackTrace();
		}
		ProductVO pvo = new ProductVO();
		
		pvo.setP_num(Integer.parseInt(mr.getParameter("p_num")));
		pvo.setP_name(mr.getParameter("p_name"));
		pvo.setP_content(mr.getParameter("p_content"));
		pvo.setP_price(mr.getParameter("p_price"));
		pvo.setP_saleprice(mr.getParameter("p_saleprice"));
		
		// 이미지 수정
		File file = mr.getFile("p_image");
		String oldFile = mr.getParameter("oldFile");
		
		if (file == null) {
			if (oldFile != null) {
				pvo.setP_image(oldFile);
			} else {
				pvo.setP_image("");
			}
		} else {
			if (oldFile != null) {
				String path = request.getServletContext().getRealPath("/images");
				File dFile = new File(path + "/" + oldFile);
				if (dFile.exists()) {
					dFile.delete();
				}
			}
			String newFile = file.getName();
			pvo.setP_image(newFile);
		}
		int result = ProductDAO.updateProduct(pvo);
		if (result>0) {
			return "product_view_all.jsp";
		} else {
			// 기본타입이 error 이므로 에러페이지 이동
			return "PController";
		}
	}

}

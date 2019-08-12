package com.wines.co.model.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.DAO.QnaDAO;
import com.wines.co.VO.PagingVO;
import com.wines.co.VO.QnaVO;

public class GoQnaPageAction implements QnaAction{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		PagingVO pvo = new PagingVO();
		pvo.setTotalRecord(QnaDAO.getTotalRecordCount());
		
		pvo.setTotalPage();
		
		String nowPage = request.getParameter("nowPage");
		if (nowPage != null) {
			pvo.setNowPage(Integer.parseInt(nowPage));
		}
		
		pvo.setBegin( (pvo.getNowPage() - 1) * pvo.getNumPerPage() + 1 );
		pvo.setEnd( pvo.getBegin() - 1 + pvo.getNumPerPage() );
		
		pvo.setBeginPage( ((pvo.getNowPage()-1) / pvo.getPagePerBlock())  *  pvo.getPagePerBlock()  +  1 );
		pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock() - 1);
		
		int begin = pvo.getBegin();
		int end = pvo.getEnd();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		List<QnaVO> list = QnaDAO.getList(map);
		
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);
		
		return "qna_page.jsp";
	}
}

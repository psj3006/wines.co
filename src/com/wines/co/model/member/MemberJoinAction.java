package com.wines.co.model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.DAO.MemberDAO;
import com.wines.co.VO.MemberVO;

public class MemberJoinAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setPw(pw);
		mvo.setName(name);
		mvo.setAddr(addr);
		mvo.setTel(tel);
		int result = MemberDAO.signUp(mvo);
		
		if (result>0) {
			return "main_page.jsp";
		} else {
			// 기본타입이 error 이므로 에러페이지 이동
			return "MController";
		}
	}

}

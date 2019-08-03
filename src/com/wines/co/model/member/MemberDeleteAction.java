package com.wines.co.model.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wines.co.DAO.MemberDAO;
import com.wines.co.VO.MemberVO;

public class MemberDeleteAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String id = mvo.getId();
		
		int result = MemberDAO.deleteMember(id);
		if (result>0) {
			// 로그아웃을 통해 세션과 쿠키 초기화하고 메인으로 이동
			return "MController?type=logout";
		} else {
			return "error_page.jsp";
		}
	}

}

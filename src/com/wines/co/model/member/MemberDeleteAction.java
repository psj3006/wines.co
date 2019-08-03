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
			// �α׾ƿ��� ���� ���ǰ� ��Ű �ʱ�ȭ�ϰ� �������� �̵�
			return "MController?type=logout";
		} else {
			return "error_page.jsp";
		}
	}

}

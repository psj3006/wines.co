package com.wines.co.model.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wines.co.DAO.MemberDAO;
import com.wines.co.VO.MemberVO;

public class MemberLoginAction implements MemberAction{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		// �α������� üũ�ڽ� üũ����
		String chk = request.getParameter("ckb");
		
		// ���� ������ ���� mvo ����
		MemberVO mvo = MemberDAO.getOneMember(id);
		
		// �α��������� Ȯ���ϱ� ���� ���� ����
		HttpSession session = request.getSession(true);
		session.setAttribute("mvo", mvo);
		
		// �α��� ���� üũ�ÿ� ��Ű ����
		if (chk != null) {
			Cookie cookie = new Cookie("id", id);
			cookie.setPath("/");
			// �����ϰ� ���� (�����Ͼȿ� �ٽ� Ȩ������ ���ӽ� ����) - GoMainAction ���� ó��
			cookie.setMaxAge(7*24*60*60);
			response.addCookie(cookie);
		}
		
		return "MController?type=goMain";
	}

}

package com.wines.co.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wines.co.DAO.MemberDAO;
import com.wines.co.VO.MemberVO;
import com.wines.co.model.member.MemberAction;
import com.wines.co.model.product.ProductAction;

public class GoMainAction implements MemberAction, ProductAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(true);
		MemberVO mvo = null;
        // ����Ȯ������ �α��� ���� üũ
        boolean session_chk = false;
        if (session.getAttribute("mvo") != null) {
        	session_chk = true;
        	mvo = (MemberVO)session.getAttribute("mvo");
        }
                    
        // ��ŰȮ������ �α��� ���� üũ
        boolean cookie_chk = false;
        // ��Ű ����, ���ǻ����� ���� ����
        String id = "";
        
    	Cookie[] cookies = request.getCookies();
    	if (cookies != null && cookies.length > 0) {
    		for (int i=0; i<cookies.length; i++) { 
    	// id��� �̸��� ��Ű�� �����ϸ�
    		   if (cookies[i].getName().equals("id")) { 
    		   cookie_chk = true;
    		   id = cookies[i].getValue();
    		   }
    		}
    	}
    	// ���Ǿ��� ��Ű�� �����Ҷ� (�������� ���ٰ� ���߿� �ٽ� ������)
    	// ��Ű�� �����ϰ�(����������) ������ �ٽ� �������.
    	if (!session_chk && cookie_chk) {
    		// ��Ű���� (������)
    		Cookie cookie = new Cookie("id", id);
    	    cookie.setPath("/");
    	    cookie.setMaxAge(7*24*60*60);
    	    response.addCookie(cookie);
    	    
    	    // ���ǻ���
    		mvo = MemberDAO.getOneMember(id);
    	    session.setAttribute("mvo", mvo);
    	}
    	session.setAttribute("session_chk", session_chk);
		session.setAttribute("cookie_chk", cookie_chk);
		return "main_page.jsp";
	}

}

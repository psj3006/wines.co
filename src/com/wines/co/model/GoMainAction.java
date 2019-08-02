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
        // 세션확인으로 로그인 여부 체크
        boolean session_chk = false;
        if (session.getAttribute("mvo") != null) {
        	session_chk = true;
        	mvo = (MemberVO)session.getAttribute("mvo");
        }
                    
        // 쿠키확인으로 로그인 여부 체크
        boolean cookie_chk = false;
        // 쿠키 갱신, 세션생성을 위한 변수
        String id = "";
        
    	Cookie[] cookies = request.getCookies();
    	if (cookies != null && cookies.length > 0) {
    		for (int i=0; i<cookies.length; i++) { 
    	// id라는 이름의 쿠키가 존재하면
    		   if (cookies[i].getName().equals("id")) { 
    		   cookie_chk = true;
    		   id = cookies[i].getValue();
    		   }
    		}
    	}
    	// 세션없이 쿠키만 존재할때 (브라우저를 껐다가 나중에 다시 켰을때)
    	// 쿠키를 갱신하고(일주일유지) 세션을 다시 만들어줌.
    	if (!session_chk && cookie_chk) {
    		// 쿠키갱신 (일주일)
    		Cookie cookie = new Cookie("id", id);
    	    cookie.setPath("/");
    	    cookie.setMaxAge(7*24*60*60);
    	    response.addCookie(cookie);
    	    
    	    // 세션생성
    		mvo = MemberDAO.getOneMember(id);
    	    session.setAttribute("mvo", mvo);
    	}
    	session.setAttribute("session_chk", session_chk);
		session.setAttribute("cookie_chk", cookie_chk);
		return "main_page.jsp";
	}

}

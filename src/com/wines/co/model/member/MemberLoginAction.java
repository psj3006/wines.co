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
		// 로그인유지 체크박스 체크여부
		String chk = request.getParameter("ckb");
		
		// 세션 생성을 위해 mvo 생성
		MemberVO mvo = MemberDAO.getOneMember(id);
		
		// 로그인했음을 확인하기 위한 세션 생성
		HttpSession session = request.getSession(true);
		session.setAttribute("mvo", mvo);
		
		// 로그인 유지 체크시에 쿠키 생성
		if (chk != null) {
			Cookie cookie = new Cookie("id", id);
			cookie.setPath("/");
			// 일주일간 유지 (일주일안에 다시 홈페이지 접속시 갱신) - GoMainAction 에서 처리
			cookie.setMaxAge(7*24*60*60);
			response.addCookie(cookie);
		}
		
		return "MController?type=goMain";
	}

}

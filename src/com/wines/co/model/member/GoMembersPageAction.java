package com.wines.co.model.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.DAO.MemberDAO;
import com.wines.co.VO.MemberVO;

public class GoMembersPageAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		List<MemberVO> list = MemberDAO.getAllMembers();
		request.setAttribute("list", list);
		
		return "manage_members.jsp";
	}

}

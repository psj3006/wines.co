package com.wines.co.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wines.co.model.ErrorAction;
import com.wines.co.model.GoMainAction;
import com.wines.co.model.member.GoMemberDetailPageAction;
import com.wines.co.model.member.GoMembersPageAction;
import com.wines.co.model.member.MemberAction;
import com.wines.co.model.member.MemberDeleteAction;
import com.wines.co.model.member.MemberJoinAction;
import com.wines.co.model.member.MemberLoginAction;
import com.wines.co.model.member.MemberLogoutAction;
import com.wines.co.model.member.MemberUpdateAction;

@WebServlet("/MController")
public class MController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String type = "error";
		String param_type = request.getParameter("type");
		if (param_type != null && !param_type.isEmpty() ) {
			type = param_type;
		}
		
		MemberAction memberAction = null;
		if (type.equals("error")) {
			memberAction = new ErrorAction();
		} else if (type.equals("goMain")) {
			memberAction = new GoMainAction();
		} else if (type.equals("signUp")) {
			memberAction = new MemberJoinAction();
		} else if (type.equals("login")) {
			memberAction = new MemberLoginAction();
		} else if (type.equals("logout")) {
			memberAction = new MemberLogoutAction();
		} else if (type.equals("update")) {
			memberAction = new MemberUpdateAction();
		} else if (type.equals("delete")) {
			memberAction = new MemberDeleteAction();
		} else if (type.equals("goManageMembers")) {
			memberAction = new GoMembersPageAction();
		} else if (type.equals("goMemberDetail")) {
			memberAction = new GoMemberDetailPageAction();
		}
		
		String path = memberAction.process(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

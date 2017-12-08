package com.baseball.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.admin.dao.AdminDaoImpl;
import com.baseball.factory.AdminActionFactory;
import com.baseball.util.Constance;
import com.baseball.util.PageMove;
import com.baseball.member.model.MemberDetailDto;
import com.baseball.member.service.MemberServiceImpl;
import com.baseball.util.StringEncoder;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		String path = "/index.jsp";
		
		if("usermanage".equals(act)) {
			path = "/admin/adminuser.jsp";
			PageMove.forward(request, response, path);
		}else if("memberlist".equals(act)) {
			path=AdminActionFactory.getUserListAction().execute(request, response);
			PageMove.forward(request, response, path);
			
		}else if("updatePen".equals(act)){
			String id = request.getParameter("id");
			String type = request.getParameter("type");
			AdminDaoImpl.getAdminDao().updatePen(id,type);;
		}else if("changestat".equals(act)){
			String id = request.getParameter("id");
			int stat = Integer.parseInt(request.getParameter("stat"));
			AdminDaoImpl.getAdminDao().changestat(id, stat);
		}else if("notice".equals(act)){
			path="/admin/notice.jsp";
			PageMove.redirect(request, response, path);
		}else if("todaypl".equals(act)){
			
		}else if("mvnowrite".equals(act)){
			PageMove.redirect(request, response, "/admin/noticewrite.jsp");
		}else if("writeno".equals(act)){
			System.out.println("dd");
			path=AdminActionFactory.getWriteNoticeAction().execute(request, response);
			PageMove.forward(request, response, path);
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}else if("".equals(act)){
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding(Constance.MAIN_ENCODING);

		doGet(request, response);
	}

}

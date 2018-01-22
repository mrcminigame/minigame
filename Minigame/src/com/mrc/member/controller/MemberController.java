package com.mrc.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mrc.controller.RequestMapping;

public class MemberController {
	@RequestMapping("login.do")
	public String login(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../gameMember/login.jsp");
		return "gameMain/main.jsp";
	}


	@RequestMapping("memberJoin.do")
	public String memberJoin(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("memberJoin :" + ex.getMessage());
		}
		MemberVO vo = new MemberVO();
//		private String email;
//		private String pwd;
//		private String memName;
//		private String nicName;
//		private String phone;
//		private String memGrdCode;
//		private String regDt;
//		private String modDt;
//		private String useYn;
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		String pwd2 = req.getParameter("pwd2");
		String memName = req.getParameter("memName");
		String nicName = req.getParameter("nicName");
		String phone = req.getParameter("phone");
		
		vo.setEmail(email);
		vo.setPwd(pwd);
		vo.setMemName(memName);
		vo.setNicName(nicName);
		vo.setPhone(phone);
		
		MemberDAO.memberJoin(vo);
		req.setAttribute("main_jsp", "../main/main.jsp");
		return "main.do";
	}
}

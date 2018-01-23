package com.mrc.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.ResponseWrapper;

import com.mrc.controller.Controller;
import com.mrc.controller.RequestMapping;

@Controller
public class MemberController {
/*	
	@RequestMapping("login.do")
	public String login(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../gameMember/login.jsp");
		return "view/member/login.jsp";
	}*/
	
	/*@RequestMapping("memberJoin.do")
	public String join(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../member/memberJoin.jsp");
		
		return "view/member/memberJoin.jsp";
	
	}*/
	
	@RequestMapping("emailCheck.do")
	public String checkMember(HttpServletRequest req, HttpServletResponse res )
	{
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("memberCheck :" + ex.getMessage());
		}
		String email = req.getParameter("email");
		/*String count = MemberDAO.checkMember(email);
		
		System.out.println(count);
		req.setAttribute(count, "count");*/
		System.out.println(email);
		return MemberDAO.checkMember(email);
	}
	
	@RequestMapping("memberJoin.do")
	public String memberJoin(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("memberJoin :" + ex.getMessage());
		}
		MemberVO vo = new MemberVO();
		
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		//String pwd2 = req.getParameter("pwd2");
		//String memName = req.getParameter("memName");
		String nicName = req.getParameter("nicName");
		String phone = req.getParameter("phone");
			
		vo.setEmail(email);
		vo.setPwd(pwd);		
		vo.setNicName(nicName);
		vo.setPhone(phone);
		
		
		MemberDAO.memberJoin(vo);
		req.setAttribute("main_jsp", "../main/main.jsp");
		return "main.do";
	}
}

package com.mrc.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.ResponseWrapper;

import com.mrc.controller.Controller;
import com.mrc.controller.RequestMapping;

@Controller
public class MemberController {
	/*
	 * @RequestMapping("login.do") public String login(HttpServletRequest req,
	 * HttpServletResponse res) { req.setAttribute("main_jsp",
	 * "../gameMember/login.jsp"); return "view/member/login.jsp"; }
	 */

	/*
	 * @RequestMapping("memberJoin.do") public String join(HttpServletRequest
	 * req, HttpServletResponse res) { req.setAttribute("main_jsp",
	 * "../member/memberJoin.jsp");
	 * 
	 * return "view/member/memberJoin.jsp";
	 * 
	 * }
	 */

	@RequestMapping("emailCheck.do")
	public String emailCheck(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("emailCheck :" + ex.getMessage());
		}
		String email = req.getParameter("email");
		System.out.println(email);
		String count = MemberDAO.emailCheck(email);
		req.setAttribute("count", count);

		return "view/member/countCheck.jsp";
	}

	@RequestMapping("nicNameCheck.do")
	public String nicNameCheck(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("nicNameCheck :" + ex.getMessage());
		}
		String nicName = req.getParameter("nicName");
		System.out.println(nicName);
		String count = MemberDAO.nicNameCheck(nicName);
		req.setAttribute("count", count);

		return "view/member/countCheck.jsp";
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
		String nicName = req.getParameter("nicName");
		String phone = req.getParameter("phone");
		System.out.println(email);
		System.out.println(pwd);
		System.out.println(nicName);
		System.out.println(phone);
		vo.setEmail(email);
		vo.setPwd(pwd);
		vo.setNicName(nicName);
		vo.setPhone(phone);
		
		MemberDAO.memberJoin(vo);
		req.setAttribute("main_jsp", "../main/default.jsp");
		return "view/main/main.jsp";
	}
}

package com.mrc.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	@RequestMapping("loginOk.do")
	public String memberlogin(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();

		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");

		String count = MemberDAO.emailCheck(email);
		String result = "";

		if (count.equals("0")) {
			result = "NOID";
		} else {
			MemberVO vo = MemberDAO.passwordCheck(email);
			if (pwd.equals(vo.getPwd())) {
				result = "OK";
				session.setAttribute("email", email);
				session.setAttribute("nic_Name", vo.getNic_Name());
				session.setAttribute("phone", vo.getPhone());
				session.setAttribute("memGrdCode", vo.getMem_Grd_Code());
				session.setAttribute("modDt", vo.getMod_Dt());
				session.setAttribute("regDt", vo.getReg_Dt());
				session.setAttribute("useYn", vo.getUse_Yn());
				session.setAttribute("pwd", vo.getPwd());
				System.out.println(vo.getEmail());
				System.out.println(vo.getNic_Name());
				System.out.println(vo.getPwd());
				System.out.println(vo.getMem_Grd_Code());
				System.out.println(vo.getPhone());
			} else {
				result = "NOPWD";
			}
		}
		System.out.println(result);
		req.setAttribute("result", result);
		return "view/member/login_Ok.jsp";
	}
	@RequestMapping("logout.do")
	public String memberLogout(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		session.invalidate();
		return "view/member/logout_Ok.jsp";
	}
	@RequestMapping("emailCheck.do")
	public String emailCheck(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("emailCheck :" + ex.getMessage());
		}
		String email = req.getParameter("email");
		String count = MemberDAO.emailCheck(email);

		return "view/member/countCheck.jsp";
	}

	@RequestMapping("nic_NameCheck.do")
	public String nic_NameCheck(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("nic_NameCheck :" + ex.getMessage());
		}
		String nic_Name = req.getParameter("nic_Name");
		String count = MemberDAO.nic_NameCheck(nic_Name);

		return "view/member/countCheck.jsp";
	}

	@RequestMapping("memberInsert.do")
	public String memberJoin(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("memberJoin :" + ex.getMessage());
		}
		MemberVO vo = new MemberVO();

		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		String nic_Name = req.getParameter("nic_Name");
		String phone = req.getParameter("phone");
		System.out.println(email);
		System.out.println(pwd);
		System.out.println(nic_Name);
		System.out.println(phone);
		vo.setEmail(email);
		vo.setPwd(pwd);
		vo.setNic_Name(nic_Name);
		vo.setPhone(phone);

		MemberDAO.memberJoin(vo);
		req.setAttribute("main_jsp", "../main/default.jsp");
		return "view/main/main.jsp";
	}
}

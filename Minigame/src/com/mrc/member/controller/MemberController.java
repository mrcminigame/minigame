package com.mrc.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	//memberUpdate.do
	@RequestMapping("memberUpdate.do")
	public String memberUpdate(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("memberJoin :" + ex.getMessage());
		}
		
		String nic_Name=req.getParameter("nic_Name");
		String email = req.getParameter("email");
		String pwd = req.getParameter("changepwd");
		String changepwd = req.getParameter("changepwd2");
		String phone=req.getParameter("phone");

		MemberVO vo=new MemberVO();
		vo.setEmail(email);
		if(changepwd.equals(""))
		{
			vo.setPwd(pwd);
		}			
		else
		{
			vo.setPwd(changepwd);
		}			
		vo.setNic_Name(nic_Name);
		vo.setPhone(phone);
		
	
		req.setAttribute("vo", vo);
		MemberDAO.memberUpdate(vo);
		session.invalidate();

		return "main.do";
	}
	@RequestMapping("deleteMember.do")
	public String deleteMember(HttpServletRequest req, HttpServletResponse res) 
	{
		String email = req.getParameter("useremail");
		Map <String ,Object> map=new HashMap<>();
		map.put("useYn", "N");
		map.put("email", email);
		
		MemberDAO.deleteMember(map);

		return "view/main/main.jsp";
	}
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
				if(vo.getUse_Yn().equals("Y"))
				{
					result = "OK";
					session.setAttribute("email", email);
					session.setAttribute("nic_Name", vo.getNic_Name());
					session.setAttribute("phone", vo.getPhone());
					session.setAttribute("mem_Grd_Code", vo.getMem_Grd_Code());
					session.setAttribute("mod_Dt", vo.getMod_Dt());
					session.setAttribute("reg_Dt", vo.getReg_Dt());
					session.setAttribute("use_Yn", vo.getUse_Yn());
					session.setAttribute("pwd", vo.getPwd());
				}
				else if(vo.getUse_Yn().equals("N"))
				{
					result = "NOID";
				}

			} else {
				result = "NOPWD";
			}
		}
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
		req.setAttribute("count", count);
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

		req.setAttribute("count", count);
		return "view/member/countCheck.jsp";
	}
	@RequestMapping("admin.do")
	public String admin(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("admin :" + ex.getMessage());
		}
		List<MemberVO> list = MemberDAO.getMemberList();
	

		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../member/admin.jsp");
		
		return "view/main/main.jsp";
	}
	@RequestMapping("searchResult.do")
	public String searchResult(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("searchResult :" + ex.getMessage());
		}
		String searchKey = req.getParameter("searchKey");
		
		List<MemberVO> list = MemberDAO.searchResult(searchKey);
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../admin/searchResult.jsp");
		return "view/main/main.jsp";
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
		vo.setEmail(email);
		vo.setPwd(pwd);
		vo.setNic_Name(nic_Name);
		vo.setPhone(phone);

		MemberDAO.memberJoin(vo);
		req.setAttribute("main_jsp", "../main/default.jsp");
		return "view/main/main.jsp";
	}
}

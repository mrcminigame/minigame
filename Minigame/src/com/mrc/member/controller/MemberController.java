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
		MemberDAO.memberJoin(vo);
		req.setAttribute("main_jsp", "../gameMain/main.jsp");
		return "main.do";
	}

	// 비밀번호찾기 부분
	@RequestMapping("passwordEmailCheck.do")
	public String passwordemailCheWck(HttpServletRequest req, HttpServletResponse res) {
		String recoveryEmail = req.getParameter("recoveryEmail");
		MemberVO vo = MemberDAO.passwordEmailCheck(recoveryEmail);
		System.out.println();
		req.setAttribute("vo", vo);
		return "gameMember/recoveryEmail.jsp";
	}

	// 수정하기
	@RequestMapping("memberUpdate.do")
	public String memberUpdate(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("memberJoin :" + ex.getMessage());
		}

		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String pwd = req.getParameter("Mpassword");
		String telnumber = req.getParameter("telnumber");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String day = req.getParameter("day");
		String birthday = year + "-0" + month + "-" + day;
		String grade = req.getParameter("grade");

		MemberVO vo = new MemberVO();
		vo.setMemName(id);
		vo.setMember_id(email);
		vo.setMember_pwd(pwd);
		vo.setMember_phone(telnumber);
		vo.setMember_birthday(birthday);

		req.setAttribute("vo", vo);
		MemberDAO.memberUpdate(vo);
		session.invalidate();
		return "gameMain/main.jsp";
	}

	// admin 페이지
	@RequestMapping("adminpage.do")
	public String adminpage(HttpServletRequest req, HttpServletResponse res) {
		List<MemberVO> list = MemberDAO.adminListData();
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../gameMyPage/adminpage.jsp");
		return "gameMain/main.jsp";
	}

	@RequestMapping("member_ok.do")
	public String member_ok(HttpServletRequest req, HttpServletResponse res) {
		String no = req.getParameter("no");
		MemberDAO.memberok(Integer.parseInt(no));
		return "member_list.do";
	}

	@RequestMapping("member_iok.do")
	public String member_iok(HttpServletRequest req, HttpServletResponse res) {
		String no = req.getParameter("no");
		MemberDAO.memberiok(Integer.parseInt(no));
		return "member_list.do";
	}
}

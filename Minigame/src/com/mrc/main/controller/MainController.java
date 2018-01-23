package com.mrc.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mrc.controller.Controller;
import com.mrc.controller.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("main.do")
	public String main_page(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../main/default.jsp");
		return "view/main/main.jsp";
	}
	@RequestMapping("memberJoin.do")
	public String sign_up(HttpServletRequest req, HttpServletResponse res) {

		req.setAttribute("main_jsp", "../member/memberJoin.jsp");
			
		return "view/main/main.jsp";
	}
	@RequestMapping("login.do")
	public String login(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../member/login.jsp");
		return "view/main/main.jsp";
	}
}

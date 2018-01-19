package com.mrc.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mrc.controller.Controller;
import com.mrc.controller.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("main.do")
	public String main_page(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../javascript/main/default.jsp");
		return "javascript/main/main.jsp";
	}

}

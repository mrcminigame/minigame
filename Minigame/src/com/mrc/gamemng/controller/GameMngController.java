package com.mrc.gamemng.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mrc.controller.RequestMapping;

public class GameMngController {

	@RequestMapping("3.do")
	public String sudokuGame(HttpServletRequest req, HttpServletResponse res) {

		req.setAttribute("main_jsp", "../game/sudokuGame.jsp");

		return "view/main/main.jsp";
	}
}

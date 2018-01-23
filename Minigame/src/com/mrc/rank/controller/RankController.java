package com.mrc.rank.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mrc.controller.Controller;
import com.mrc.controller.RequestMapping;

@Controller
public class RankController {
/*	@RequestMapping("rank.do")
	public String starlist(HttpServletRequest req, HttpServletResponse res, RankVO rankVO) {
		RankDAO rd = new RankDAO();
//		try {
//			req.setCharacterEncoding("EUC-KR");
//		} catch (Exception ex) {
//		}

		String email = req.getParameter("email");
		String gameNo = req.getParameter("gameNo");
		String totalScore = req.getParameter("totalScore");
		String win = req.getParameter("win");
		String lose = req.getParameter("lose");
		String highScore = req.getParameter("highScore");
		//RankVO rankVO = new RankVO();
		rankVO.setEmail(email);
		rankVO.setGameNo(Integer.parseInt(gameNo));
		rankVO.setTotalScore(Integer.parseInt(totalScore));
		rankVO.setWin(Integer.parseInt(win));
		rankVO.setLose(Integer.parseInt(lose));
		rankVO.setHighScore(Integer.parseInt(highScore));
		List<RankVO> list = rd.rankListData();
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../main/main.jsp");
		return "main.do";
		//return "rank/rankList.jsp";
	}*/

}

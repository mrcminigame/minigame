package com.mrc.gamemng.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mrc.controller.Controller;
import com.mrc.controller.RequestMapping;
import com.mrc.rank.controller.RankVO;
@Controller
public class GameMngController {

	@RequestMapping("insertRank.do")
	public String insertRank(HttpServletRequest req, HttpServletResponse res) {
		GameMngDAO dao = new GameMngDAO();
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("snakeRank :" + ex.getMessage());
		}
		HttpSession session=req.getSession();
		RankVO vo = new RankVO();
		RankVO cVO = new RankVO();
		String email = (String) session.getAttribute("email");
		String gameNo = req.getParameter("gameNo");
		int highScore = Integer.parseInt(req.getParameter("score"));
		vo.setEmail(email);
		vo.setGameNo(Integer.parseInt(gameNo));
		vo.setHighScore(highScore);
		
		cVO = dao.getCurrentHighScore(vo);
		try{
			if(cVO.getHighScore() < highScore)
			{
				dao.insertRank(vo);	
			}
		}
		catch(NullPointerException e)
		{
			dao.insertRank(vo);
		}
		
		
		return "main.do";
	}
}

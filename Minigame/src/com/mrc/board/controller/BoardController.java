package com.mrc.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mrc.board.service.BoardService;
import com.mrc.controller.Controller;
import com.mrc.controller.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping("registBoardInq.do")
	public String starlist(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("¿©±â");
		BoardDAO bs = new BoardDAO();
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
		}
	//	HttpSession session = req.getSession();
		String inqTitle = req.getParameter("inqTitle");
		String inqContent = req.getParameter("inqContent");
		BoardVO boardVO = new BoardVO();
		boardVO.setInqTitle(inqTitle);
		boardVO.setInqContent(inqContent);
		boardVO.setInqMemEmail("hong@gil.dong");
		
		bs.insertBoardInq(boardVO);
//		req.setAttribute("no", bno);
		
		//List<BoardVO> list = bs.boardListData();
	//	req.setAttribute("list", list);
		return "board.do";
	}
}

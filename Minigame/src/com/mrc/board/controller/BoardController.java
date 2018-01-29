package com.mrc.board.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mrc.controller.Controller;
import com.mrc.controller.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping("registBoardInq.do")
	public String registBoardInq(HttpServletRequest req, HttpServletResponse res) {
		BoardDAO bs = new BoardDAO();
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
		}
		HttpSession session = req.getSession();
		String inqTitle = req.getParameter("inqTitle");
		String inqContent = req.getParameter("inqContent");
		BoardVO boardVO = new BoardVO();
		boardVO.setInqTitle(inqTitle);
		boardVO.setInqContent(inqContent);
		String email = (String)session.getAttribute("email");
		boardVO.setInqMemEmail(email); 
				
		bs.insertBoardInq(boardVO);
		return "board.do";
	}
	@RequestMapping("registBoardAns.do")
	public String registBoardAns(HttpServletRequest req, HttpServletResponse res) {
		BoardDAO bs = new BoardDAO();
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
		}
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
		int boardNo =Integer.parseInt(req.getParameter("boardNum"));
		BoardVO boardVO = new BoardVO();
		boardVO.setAnsContent((req.getParameter("ansContent")));
		boardVO.setBoardNo(boardNo);
		boardVO.setAnsMemEmail(email);
		bs.insertBoardAns(boardVO);
		/*return "board.do";*/
		return "BoardDetailView.do?boardNo="+boardNo;
	}
	
	
	@RequestMapping("delBoard.do")
	public String delBoardInq(HttpServletRequest req, HttpServletResponse res) {
		BoardDAO bs = new BoardDAO();
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			
		}
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		String flag = req.getParameter("flag");
		BoardVO boardVO = new BoardVO();
		boardVO.setBoardNo(boardNo);
		//boardVO.setFlag("inq");
		boardVO.setFlag("ans");
		
		bs.deleteBoard(boardVO);
		if(flag.equals("ans")){
			return "BoardDetailView.do?boardNo="+boardNo;
		}else{
			return "board.do";
		}
	}
}

package com.mrc.board.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	//	HttpSession session = req.getSession();
		String inqTitle = req.getParameter("inqTitle");
		String inqContent = req.getParameter("inqContent");
		BoardVO boardVO = new BoardVO();
		boardVO.setInqTitle(inqTitle);
		boardVO.setInqContent(inqContent);
		boardVO.setInqMemEmail("hong@gil.dong"); //TODO:로그인 계정받아오기
		
		bs.insertBoardInq(boardVO);
		return "board.do";
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
		boardVO.setFlag("inq");
		
		bs.deleteBoard(boardVO);
		return "board.do";
	}
}


package com.mrc.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mrc.board.controller.BoardDAO;
import com.mrc.board.controller.BoardVO;
import com.mrc.controller.Controller;
import com.mrc.controller.RequestMapping;
import com.mrc.member.controller.MemberDAO;
import com.mrc.rank.controller.RankDAO;
import com.mrc.rank.controller.RankVO;

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
	@RequestMapping("rank.do")
	public String rank(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("rank :" + ex.getMessage());
		}
		RankDAO rd = new RankDAO();
		List<RankVO> list = rd.rankListData();
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../rank/rankList.jsp");
		return "view/main/main.jsp";
	}
	
	@RequestMapping("board.do")
	public String board(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("board :" + ex.getMessage());
		}
		BoardDAO bd = new BoardDAO();
		List<BoardVO> boardList = bd.boardListData();
		req.setAttribute("boardList", boardList);
		req.setAttribute("main_jsp", "../board/boardList.jsp");
		return "view/main/main.jsp";
	}
	
}

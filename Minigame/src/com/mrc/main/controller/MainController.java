
package com.mrc.main.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		int gameNo = 1;
		List<RankVO> firstList = rd.rankListData(gameNo);
		req.setAttribute("firstList", firstList);
		gameNo = 2;
		List<RankVO> secondList = rd.rankListData(gameNo);
		req.setAttribute("secondList", secondList);
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
		  BoardVO boardVO = new BoardVO();
		
		  String page = req.getParameter("page");
		
	      // request => 기존요청값 + 추가 (setAttribute())
	      if(page==null)
	         page="1";
	      int curpage = Integer.parseInt(page);
	      int rowSize=10;
	      int start = (rowSize*curpage)-(rowSize-1);
	      int end = rowSize*curpage;
	      
	      boardVO.setStart(start);
	      boardVO.setEnd(end);
	      
	      Date date = new Date();
	      SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
	      String today = sdf.format(date);
	      
	    
	      List<BoardVO> boardList = bd.boardListData(boardVO);
	
	      int totalpage= BoardDAO.boardTotalPage();
	      
	      req.setAttribute("boardList", boardList);
	      req.setAttribute("curpage", curpage);
	      req.setAttribute("totalpage", totalpage);
	      req.setAttribute("today", today);
	      req.setAttribute("main_jsp", "../board/boardList.jsp");
		return "view/main/main.jsp";
	}
	
	@RequestMapping("BoardRegistView.do")
	public String BoardRegistView(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../board/boardRegist.jsp");
		return "view/main/main.jsp";
	}
	
	@RequestMapping("BoardDetailView.do")
	public String BoardDetailView(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println("boardDetail :" + ex.getMessage());
		}
		BoardDAO bd = new BoardDAO();
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		bd.updateViewCnt(boardNo);
		BoardVO detail = bd.boardDetailInfo(boardNo);
		req.setAttribute("detail", detail);
		req.setAttribute("main_jsp", "../board/boardDetail.jsp");
		return "view/main/main.jsp";
	}
	
}

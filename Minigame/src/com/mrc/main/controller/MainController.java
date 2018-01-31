
package com.mrc.main.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mrc.board.controller.BoardDAO;
import com.mrc.board.controller.BoardVO;
import com.mrc.controller.Controller;
import com.mrc.controller.RequestMapping;
import com.mrc.gamemng.controller.GameMngDAO;
import com.mrc.gamemng.controller.GameMngVO;
import com.mrc.rank.controller.RankDAO;
import com.mrc.rank.controller.RankVO;

@Controller
public class MainController {
	@RequestMapping("main.do")
	public String main_page(HttpServletRequest req, HttpServletResponse res) {
		GameMngDAO dao = new GameMngDAO();
		List<RankVO> list = dao.gameListData();
		
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../main/default.jsp");
		return "view/main/main.jsp";
	}

	@RequestMapping("memberJoin.do")
	public String sign_up(HttpServletRequest req, HttpServletResponse res) {

		req.setAttribute("main_jsp", "../member/memberJoin.jsp");

		return "view/main/main.jsp";
	}
	@RequestMapping("adminCheck.do")
	public String adminCheck(HttpServletRequest req, HttpServletResponse res) {


		req.setAttribute("main_jsp", "../member/adminCheck.jsp");
		
		return "view/main/main.jsp";
	}

	@RequestMapping("login.do")
	public String login(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../member/login.jsp");
		return "view/main/main.jsp";
	}
	

	@RequestMapping("myPage.do")
	public String MyPage(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../member/myPage.jsp");
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
		GameMngDAO gmd = new GameMngDAO();
		
		List <RankVO> gameList = gmd.gameListData();
		List<Map<String,Object>> resultList = new ArrayList<>();
		
		for(RankVO rv : gameList){										//게임 리스트 가져오기 
			List<RankVO> rankList = rd.rankListData(rv.getGameNo());
			int listSize = rankList.size();
			int maxSize= 5-listSize;
			int highScore =0;
			if(rankList.size()<5){										//게임랭킹 5위까지 없을 경우 null채워줌
				for(int i = 0; i < maxSize; i++){
					rankList.add(null);	
				}
			}

			if(listSize > 0){ 											// 해당게임에 대한 데이터가 하나라도 있으면 highscore넣어준다
				highScore =  rankList.get(0).getHighScore();
			}
			
			Map<String,Object> map = new HashMap<>();
			map.put("highScore", highScore);
			map.put("gameName", rv.getGameName());
			map.put("rankList", rankList);
			
			resultList.add(map);
		}
		req.setAttribute("resultList", resultList);
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
	@RequestMapping("1.do")
	public String snakeGame(HttpServletRequest req, HttpServletResponse res) {

		req.setAttribute("main_jsp", "../game/snakeGame.jsp");

		return "view/main/main.jsp";
	}
	
	@RequestMapping("2.do")
	public String ballGame(HttpServletRequest req, HttpServletResponse res) {

		req.setAttribute("main_jsp", "../game/ballGame.jsp");

		return "view/main/main.jsp";
	}
	
	@RequestMapping("3.do")
	public String sudokuGame(HttpServletRequest req, HttpServletResponse res) {

		req.setAttribute("main_jsp", "../game/othelloGame.jsp");

		return "view/main/main.jsp";
	}
}

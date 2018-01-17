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
	@RequestMapping("member.do")
	public String starlist(HttpServletRequest req, HttpServletResponse res) {
//		try {
//			req.setCharacterEncoding("EUC-KR");
//		} catch (Exception ex) {
//		}
//		HttpSession session = req.getSession();
//		String bno = req.getParameter("bno");
//		String msg = req.getParameter("msg");
//		String id = (String) session.getAttribute("email");
//		String name = (String) session.getAttribute("name");
//		NewsReplyVO rvo = new NewsReplyVO();
//		rvo.setBno(Integer.parseInt(bno));
//		rvo.setMsg(msg);
//		rvo.setId(id);
//		rvo.setName(name);
//		NewsDAO.replyNewInsert(rvo);
//		req.setAttribute("no", bno);
		System.out.println("asbasdb");
		List<BoardVO> list = BoardService.starListData();
		req.setAttribute("list", list);
		return "member/memberList.jsp";
	}
}

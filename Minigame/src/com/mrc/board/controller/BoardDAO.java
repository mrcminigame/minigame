package com.mrc.board.controller;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mrc.board.service.BoardService;

public class BoardDAO implements BoardService {
	private static SqlSessionFactory ssf;
	static { // 이벤트DAO
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
			// 파싱 완료
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	public List<BoardVO> boardListData() {
		SqlSession session = ssf.openSession();
		List<BoardVO> list = session.selectList("boardListData");
		session.close();
		return list;
	}

	public void insertBoardInq(BoardVO boardVO) {
		SqlSession session = ssf.openSession();
		session.insert("insertBoardInq",boardVO);
		session.commit();
		session.close();
		
	}

	public List<BoardVO> boardDetailInfo(String baordNo) {
		SqlSession session = ssf.openSession();
		List<BoardVO> list = session.selectList("boardDetailInfo",baordNo);
		session.close();
		return list;
	}
}

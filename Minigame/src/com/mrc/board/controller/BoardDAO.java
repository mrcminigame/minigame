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

	public List<BoardVO> boardListData(BoardVO boardVO) {
		SqlSession session = ssf.openSession();
		List<BoardVO> list = session.selectList("boardListData",boardVO);
		session.close();
		return list;
	}

	public void insertBoardInq(BoardVO boardVO) {
		SqlSession session = ssf.openSession();
		session.insert("insertBoardInq",boardVO);
		session.commit();
		session.close();
	}
	public void insertBoardAns(BoardVO boardVO) {
		SqlSession session = ssf.openSession();
		session.insert("insertBoardAns",boardVO);
		session.commit();
		session.close();
		
	}

	public BoardVO boardDetailInfo(int boardNo) {
		SqlSession session = ssf.openSession();
		BoardVO bv = session.selectOne("boardDetailInfo",boardNo);
		session.close();
		return bv;
	}

	// 총페이지 
    public static int boardTotalPage() {
       int total = 0;
       SqlSession session = null;
       
       try {
          // session : connection 연결
          session = ssf.openSession();
          total = session.selectOne("boardTotalPage");
       } catch(Exception e) {
          System.out.println(e.getMessage());
       } finally {
          // 반환
          if(session!=null)
             session.close();
       }
       return total;
    }

	public void updateViewCnt(int boardNo) {
		SqlSession session = ssf.openSession();
		session.update("updateViewCnt",boardNo);
		session.commit();
		session.close();
	}

	public void deleteBoard(BoardVO boardVO) {
		SqlSession session = ssf.openSession();
		session.update("deleteBoard",boardVO);
		session.commit();
		session.close();
	}

	
}

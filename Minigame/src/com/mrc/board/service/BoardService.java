package com.mrc.board.service;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mrc.board.controller.BoardVO;

public class BoardService {
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

	public static List<BoardVO> starListData() {
		SqlSession session = ssf.openSession();
		List<BoardVO> list = session.selectList("starListData");
		session.close();
		return list;
	}
}

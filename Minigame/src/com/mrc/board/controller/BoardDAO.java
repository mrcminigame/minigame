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
	static { // �̺�ƮDAO
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
			// �Ľ� �Ϸ�
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	public List<BoardVO> starListData() {
		SqlSession session = ssf.openSession();
		List<BoardVO> list = session.selectList("starListData");
		session.close();
		return list;
	}
}

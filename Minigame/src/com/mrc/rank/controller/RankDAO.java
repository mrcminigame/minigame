package com.mrc.rank.controller;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mrc.rank.service.RankService;

public class RankDAO implements RankService{

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

	public List<RankVO> rankListData(int gameNo) {
		SqlSession session = ssf.openSession();
		List<RankVO> list = session.selectList("rankListData",gameNo);
		session.close();
		return list;
	}
}

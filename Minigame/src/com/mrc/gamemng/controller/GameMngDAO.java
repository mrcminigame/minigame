package com.mrc.gamemng.controller;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mrc.gamemng.service.GameMngService;
import com.mrc.rank.controller.RankVO;

public class GameMngDAO implements GameMngService {
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

	public List<RankVO> gameListData() {
		SqlSession session = ssf.openSession();
		List<RankVO> list = session.selectList("gameMngListData");
		session.close();
		return list;
	}

	public void insertRank(RankVO vo) {
		// TODO Auto-generated method stub
		SqlSession session = ssf.openSession();
		session.update("insertRank", vo);
		session.commit();
	}
	
	public RankVO getCurrentHighScore(RankVO vo) {
		SqlSession session = ssf.openSession();
		return session.selectOne("getCurrentHighScore", vo);  
		
	}
}

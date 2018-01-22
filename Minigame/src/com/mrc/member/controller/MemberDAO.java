package com.mrc.member.controller;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mrc.member.service.MemberService;

public class MemberDAO implements MemberService {

	private static SqlSessionFactory ssf;
	static {
		try {
			// XML ÀÐ±â
			Reader reader = Resources.getResourceAsReader("Config.xml");

			// XML ÆÄ½Ì
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println("SqlSessionFactory : " + ex.getMessage());
		}
	}

	public static void memberJoin(MemberVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("memberJoin", vo);
		session.close();
	}


}

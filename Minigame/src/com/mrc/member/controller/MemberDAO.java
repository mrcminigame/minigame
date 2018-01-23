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
			// XML �б�
			Reader reader = Resources.getResourceAsReader("Config.xml");

			// XML �Ľ�
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

	public static String checkMember(String email) {
		SqlSession session = ssf.openSession(true);
		
		String check = Integer.toString(session.selectOne("checkMember", email)); 
		session.close();
		System.out.println(check);
		return check;
	}

}

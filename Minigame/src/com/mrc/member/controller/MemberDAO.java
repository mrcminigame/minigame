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
		System.out.println("ÈåÀ½");
		session.insert("inserMemberInfo", vo);
		session.commit();
		session.close();
	}

	public static String emailCheck(String email) {
		SqlSession session = ssf.openSession(true);

		String check = Integer.toString(session.selectOne("emailCheck", email));
		session.close();
		System.out.println(check);
		return check;
	}

	public static String nic_NameCheck(String nic_Name) {
		SqlSession session = ssf.openSession(true);

		String check = Integer.toString(session.selectOne("nic_NameCheck", nic_Name));
		session.close();
		System.out.println(check);
		return check;
	}

	public static MemberVO passwordCheck(String email) {
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("passwordCheck", email);
		} catch (Exception ex) {
			System.out.println("passwordCheck " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}

		return vo;
	}

	public static void memberUpdate(MemberVO vo) {
		SqlSession session = ssf.openSession();
		session.update("memberUpdate", vo);
		session.commit();
		session.close();
	}
}

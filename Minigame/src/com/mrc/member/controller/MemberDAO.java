package com.mrc.member.controller;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mrc.member.service.MemberService;

public class MemberDAO implements MemberService {

	private static SqlSessionFactory ssf;
	static {
		try {
			// XML 읽기
			Reader reader = Resources.getResourceAsReader("Config.xml");

			// XML 파싱
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println("SqlSessionFactory : " + ex.getMessage());
		}
	}

	public static void memberJoin(MemberVO vo) {
		SqlSession session = ssf.openSession(true);
		System.out.println("흐음");
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
		System.out.println("check : " + check);
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
		System.out.println("회원수정");
		System.out.println(vo.getEmail());
		System.out.println(vo.getNic_Name());
		System.out.println(vo.getPwd());
		System.out.println(vo.getPhone());
		session.update("memberUpdate", vo);
		session.commit();
		session.close();
	}

	public static List<MemberVO> getMemberList() {
		// TODO Auto-generated method stub
		List<MemberVO> list = new ArrayList();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("getMemberList");
		} catch (Exception ex) {
			System.out.println("getMemberList " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	public static List<MemberVO> searchResult(String searchKey) {
		// TODO Auto-generated method stub
		List<MemberVO> list = new ArrayList();
		System.out.println("DAO에서 key값"+searchKey);
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("searchResult", searchKey);
		} catch (Exception ex) {
			System.out.println("searchResult " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
			System.out.println(list.get(0).getEmail());
		

		return list;
	}

	public static void deleteMember(String email) {
		// TODO Auto-generated method stub
		System.out.println("Delete Member");
		SqlSession session = ssf.openSession();
		
		session.update("deleteMember", email);
		session.commit();
		session.close();
		
	}
}

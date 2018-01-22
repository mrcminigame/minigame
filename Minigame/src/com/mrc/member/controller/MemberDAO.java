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

	// ���̵� üũ SQL ���� ī��Ʈ�������� �κ�
	public static MemberVO memberidcheck(String id) {
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
		try {

			vo.setCount(session.selectOne("memberIdCheck", id));

		} catch (Exception ex) {
			System.out.println("memberidcheck : " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	// �̸��� üũ SQL ���� ī��Ʈ�������� �κ�
	public static MemberVO memberEmailCheck(String email) {
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
		try {

			vo.setCount(session.selectOne("memberEmailCheck", email));

		} catch (Exception ex) {
			System.out.println("memberEmailCheck : " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	// �α���ó��
	// ���̵� ��������
	public static int memberEmailCount(String email) {
		int count = 0;
		SqlSession session = ssf.openSession();
		try {
			count = session.selectOne("memberEmailCount", email);
		} catch (Exception ex) {
			System.out.println("memberEmailCount " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	// id�� �������ִ� ���� �����´�
	// ��й�ȣ�������°�
	public static MemberVO memberGetPassword(String email) {
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("memberGetPassword", email);
		} catch (Exception ex) {
			System.out.println("memberGetPassword " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	public static void memberJoin(MemberVO vo) {
		SqlSession session = ssf.openSession(true);
		session.insert("memberJoin", vo);
		session.close();
	}

	public static void memberUpdate(MemberVO vo) {
		SqlSession session = ssf.openSession();
		session.update("mypage", vo);
		session.commit();
		session.close();
	}

	public static MemberVO passwordSelect(String recovery) {
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("passwordSelect", recovery);
		} catch (Exception ex) {
			System.out.println("passwordSelect " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	// ��й�ȣã�� �̸��� üũ
	public static MemberVO passwordEmailCheck(String recoveryEmail) {
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
		try {
			vo.setPwd(session.selectOne("passwordEmailCheck", recoveryEmail));

		} catch (Exception ex) {
			System.out.println("passwordEmailCheck : " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	// admin DAO
	public static List<MemberVO> adminListData() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("adminpageListData");
		} catch (Exception ex) {
			System.out.println("adminListData" + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	// ȸ�� ��޹ٲٱ�
	public static void memberok(int no) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("member_ok", no);
		} catch (Exception ex) {
			System.out.println("memberok :" + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static void memberiok(int no) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("member_iok", no);
		} catch (Exception ex) {
			System.out.println("memberiok :" + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	// ������ ��������
	public static List<MemberVO> memberListData(Map map) {
		SqlSession session = ssf.openSession();
		List<MemberVO> list = session.selectList("memberListData", map);
		session.close();
		return list;
	}

	// ������
	public static int m_ReplyCount(int bno) {
		int count = 0;
		SqlSession session = ssf.openSession();
		try {
			count = session.selectOne("m_ReplyCount", bno);
		} catch (Exception ex) {
			System.out.println("m_ReplyCount" + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	// ��������
	public static int MemberTotalPage() {
		int total = 0;
		SqlSession session = null;

		try {
			// session : connection ����
			session = ssf.openSession();
			total = session.selectOne("MemberTotalPage");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			// ��ȯ
			if (session != null)
				session.close();
		}
		return total;
	}

}

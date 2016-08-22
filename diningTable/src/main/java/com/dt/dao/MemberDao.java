package com.dt.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import com.dt.vo.MemberVo;

@Repository
public class MemberDao {
	
	// myBatis ȯ�漳�� ������ ������ ����
	private static SqlSessionFactory factory;
	
	static{
		// ��Ʈ���� ���� ȯ�漳�� ������ ��ü ����
		try {
			Reader reader = Resources.getResourceAsReader("com/dt/data/dbConfig.xml");
			// Reader�� �Ű������� SqlSessionFactory ��ü ����
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("MemberDao Error : " + e);
		}
	}
	
	// ȸ�� ���
	public List<MemberVo> list(){
		// sqlMapper ���� ���Ǹ� �����ϱ� ���� SqlSession ��ü����
		// SqlSessionFactory�� ���� ����
		SqlSession session = factory.openSession();
		
		List<MemberVo> list = session.selectList("member.selectAll");
		session.close();
		return list;
	}
	
	// ȸ�� �� ����
	public MemberVo detail(int mNo){
		SqlSession session = factory.openSession();
		MemberVo m = session.selectOne("member.select", mNo);
		session.close();
		return m;
	}
	
	// ȸ�� �߰�
	public int insert(MemberVo m){
		SqlSession session = factory.openSession();
		int re = session.insert("member.insert", m);
		session.commit();
		session.close();
		return re;
	}
	
	// ȸ�� ���� ����
	public int update(MemberVo m){
		SqlSession session = factory.openSession();
		int re = session.update("member.update", m);
		session.commit();
		session.close();
		return re;
	}
	
	// ȸ�� ���� ����
	public int delete(int mNo){
		SqlSession session = factory.openSession();
		int re = session.delete("member.delete", mNo);
		session.commit();
		session.close();
		return re;
	}
	
	// �̸��� �ߺ� üũ
	public int emailCheck(String mEmail){
		SqlSession session = factory.openSession();
		int re = session.selectOne("member.emailCheck", mEmail);
		session.close();
		return re;
	}
	
	// ȸ�� �α���
	public MemberVo login(String mEmail, String mPwd){
		MemberVo m = null;
		HashMap map = new HashMap();
		map.put("mEmail", mEmail);
		map.put("mPwd", mPwd);
		
		SqlSession session = factory.openSession();
		m = session.selectOne("member.login", map);
		session.close();
		return m;
	}
}

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
	
	// myBatis 환경설정 파일을 참조할 변수
	private static SqlSessionFactory factory;
	
	static{
		// 스트림을 통해 환경설정 파일의 객체 생성
		try {
			Reader reader = Resources.getResourceAsReader("com/dt/data/dbConfig.xml");
			// Reader를 매개변수로 SqlSessionFactory 객체 생성
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("MemberDao Error : " + e);
		}
	}
	
	// 회원 목록
	public List<MemberVo> list(){
		// sqlMapper 파일 질의를 실행하기 위한 SqlSession 객체생성
		// SqlSessionFactory를 통해 생성
		SqlSession session = factory.openSession();
		
		List<MemberVo> list = session.selectList("member.selectAll");
		session.close();
		return list;
	}
	
	// 회원 상세 정보
	public MemberVo detail(int mNo){
		SqlSession session = factory.openSession();
		MemberVo m = session.selectOne("member.select", mNo);
		session.close();
		return m;
	}
	
	// 회원 추가
	public int insert(MemberVo m){
		SqlSession session = factory.openSession();
		int re = session.insert("member.insert", m);
		session.commit();
		session.close();
		return re;
	}
	
	// 회원 정보 수정
	public int update(MemberVo m){
		SqlSession session = factory.openSession();
		int re = session.update("member.update", m);
		session.commit();
		session.close();
		return re;
	}
	
	// 회원 정보 삭제
	public int delete(int mNo){
		SqlSession session = factory.openSession();
		int re = session.delete("member.delete", mNo);
		session.commit();
		session.close();
		return re;
	}
	
	// 이메일 중복 체크
	public int emailCheck(String mEmail){
		SqlSession session = factory.openSession();
		int re = session.selectOne("member.emailCheck", mEmail);
		session.close();
		return re;
	}
	
	// 회원 로그인
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

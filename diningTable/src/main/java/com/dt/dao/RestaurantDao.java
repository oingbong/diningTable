package com.dt.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import com.dt.vo.RestaurantVo;

@Repository
public class RestaurantDao {
	
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
			System.out.println("RestaurantDao Error : " + e);
		}
	}
	
	// 레스토랑 목록
	public List<RestaurantVo> list(){
		// sqlMapper 파일 질의를 실행하기 위한 SqlSession 객체생성
		// sqlSessionFactory를 통해 생성
		SqlSession session = factory.openSession();
		List<RestaurantVo> list = session.selectList("restaurant.selectAll");
		session.close();
		return list;
	}
	
	// 레스토랑 상세 정보
	public RestaurantVo detail(int tNo){
		SqlSession session = factory.openSession();
		RestaurantVo r = session.selectOne("restaurant.select", tNo);
		session.close();
		return r;
	}
	
	// 레스토랑 추가
	public int insert(RestaurantVo r){
		SqlSession session = factory.openSession();
		int re = session.insert("restaurant.insert", r);
		session.commit();
		session.close();
		return re;
	}
	
	// 레스토랑 정보 수정
	public int update(RestaurantVo r){
		SqlSession session = factory.openSession();
		int re = session.update("restaurant.update", r);
		session.commit();
		session.close();
		return re;
	}
	
	// 레스토랑 정보 삭제
	public int delete(int tNo){
		SqlSession session = factory.openSession();
		int re = session.delete("restaurant.delete", tNo);
		session.commit();
		session.close();
		return re;
	}
	
	// 이메일 중복 체크
	public int emailCheck(String tEmail){
		SqlSession session = factory.openSession();
		int re = session.selectOne("restaurant.emailCheck", tEmail);
		session.close();
		return re;
	}
	
	// 레스토랑 로그인
	public RestaurantVo login(String tEmail, String tPwd){
		RestaurantVo t = null;
		HashMap map  = new HashMap();
		map.put("tEmail", tEmail);
		map.put("tPwd", tPwd);
		
		SqlSession session = factory.openSession();
		t = session.selectOne("restaurant.login", map);
		session.close();
		return t;
	}
}

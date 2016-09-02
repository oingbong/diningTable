package com.dt.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import com.dt.vo.ReservationVo;

@Repository
public class ReservationDao {
	
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
			System.out.println("ReservationDao Error : " + e);
		}
	}
	
	// 예약 하기
	public int insert(ReservationVo r){
		SqlSession session = factory.openSession();
		int re = session.insert("reservation.insert", r);
		session.commit();
		session.close();
		return re;
	}
}

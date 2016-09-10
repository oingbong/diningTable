package com.dt.dao;

import java.io.Reader;
import java.util.List;

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
	
	// 예약 리스트
	public List<ReservationVo> list(int mNo){
		SqlSession session = factory.openSession();
		List<ReservationVo> list = session.selectList("reservation.selectM", mNo);
		session.close();
		return list;
	}
	
	// 레스토랑에 예약된 리스트
	public List<ReservationVo> listCo(int tNo){
		SqlSession session = factory.openSession();
		List<ReservationVo> list = session.selectList("reservation.selectT", tNo);
		session.close();
		return list;
	}
	
	// 예약 상세정보
	public ReservationVo detail(int rNo){
		SqlSession session = factory.openSession();
		ReservationVo r = session.selectOne("reservation.select", rNo);
		session.close();
		return r;
	}
	
	// 예약 하기
	public int insert(ReservationVo r){
		SqlSession session = factory.openSession();
		int re = session.insert("reservation.insert", r);
		session.commit();
		session.close();
		return re;
	}
	
	// 예약 수정
	public int update(ReservationVo r){
		SqlSession session = factory.openSession();
		int re = session.update("reservation.update", r);
		session.commit();
		session.close();
		return re;
	}
	
	// 예약 취소
	public int delete(int rNo){
		SqlSession session = factory.openSession();
		int re = session.delete("reservation.delete", rNo);
		session.commit();
		session.close();
		return re;
	}
}

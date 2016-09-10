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
			System.out.println("ReservationDao Error : " + e);
		}
	}
	
	// ���� ����Ʈ
	public List<ReservationVo> list(int mNo){
		SqlSession session = factory.openSession();
		List<ReservationVo> list = session.selectList("reservation.selectM", mNo);
		session.close();
		return list;
	}
	
	// ��������� ����� ����Ʈ
	public List<ReservationVo> listCo(int tNo){
		SqlSession session = factory.openSession();
		List<ReservationVo> list = session.selectList("reservation.selectT", tNo);
		session.close();
		return list;
	}
	
	// ���� ������
	public ReservationVo detail(int rNo){
		SqlSession session = factory.openSession();
		ReservationVo r = session.selectOne("reservation.select", rNo);
		session.close();
		return r;
	}
	
	// ���� �ϱ�
	public int insert(ReservationVo r){
		SqlSession session = factory.openSession();
		int re = session.insert("reservation.insert", r);
		session.commit();
		session.close();
		return re;
	}
	
	// ���� ����
	public int update(ReservationVo r){
		SqlSession session = factory.openSession();
		int re = session.update("reservation.update", r);
		session.commit();
		session.close();
		return re;
	}
	
	// ���� ���
	public int delete(int rNo){
		SqlSession session = factory.openSession();
		int re = session.delete("reservation.delete", rNo);
		session.commit();
		session.close();
		return re;
	}
}

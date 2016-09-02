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
	
	// ���� �ϱ�
	public int insert(ReservationVo r){
		SqlSession session = factory.openSession();
		int re = session.insert("reservation.insert", r);
		session.commit();
		session.close();
		return re;
	}
}

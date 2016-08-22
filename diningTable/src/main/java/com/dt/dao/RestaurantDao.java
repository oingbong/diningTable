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
			System.out.println("RestaurantDao Error : " + e);
		}
	}
	
	// ������� ���
	public List<RestaurantVo> list(){
		// sqlMapper ���� ���Ǹ� �����ϱ� ���� SqlSession ��ü����
		// sqlSessionFactory�� ���� ����
		SqlSession session = factory.openSession();
		List<RestaurantVo> list = session.selectList("restaurant.selectAll");
		session.close();
		return list;
	}
	
	// ������� �� ����
	public RestaurantVo detail(String tEmail){
		SqlSession session = factory.openSession();
		RestaurantVo r = session.selectOne("restaurant.select", tEmail);
		session.close();
		return r;
	}
	
	// ������� �߰�
	public int insert(RestaurantVo r){
		SqlSession session = factory.openSession();
		int re = session.insert("restaurant.insert", r);
		session.commit();
		session.close();
		return re;
	}
	
	// ������� ���� ����
	public int update(RestaurantVo r){
		SqlSession session = factory.openSession();
		int re = session.update("restaurant.update", r);
		session.commit();
		session.close();
		return re;
	}
	
	// ������� ���� ����
	public int delete(String tEmail){
		SqlSession session = factory.openSession();
		int re = session.delete("restaurant.delete", tEmail);
		session.commit();
		session.close();
		return re;
	}
}

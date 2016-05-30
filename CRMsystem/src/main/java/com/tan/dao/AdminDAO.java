package com.tan.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tan.model.Administrator;
import com.tan.model.Announcement;
import com.tan.model.Employee;


@Repository
public class AdminDAO {
	
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public List<Administrator> getAllAdmin(){
		String hsql="from administrator";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hsql);
		return query.list();
	}
	
	public <T> List<T> findByCondition(Map<String, String> paramMap, Class<T> clazz) {
		// 拼装sql(适用于简单sql查询)
		String jpql = " obj where ";
		Iterator iterator = paramMap.entrySet().iterator();//entrySet()的返回值也是返回一个entry集合
														  //Set entrySet(): 返回Map.Entry对象的视图集，即映像中的关键字/值对
		while(iterator.hasNext()) {
			Entry entry = (Entry) iterator.next();
			Object key = entry.getKey();
			Object value = entry.getValue();
			if (iterator.hasNext()) {
				jpql += "obj." + key.toString() + "=" + "'" + value.toString() + "'" + " and ";
			} else {
				jpql += "obj." + key.toString() + "=" + "'" + value.toString() + "'";
			}
		}
		System.out.println("jpql:"+jpql);
		//  "administrator" clazz.getSimpleName()
		TypedQuery<T> tQuery = entityManager.createQuery("select obj from " + "administrator" + jpql, clazz);
		List<T> resultList = tQuery.getResultList();
		for(int i=0;i<resultList.size();i++)
		{
			System.out.println(resultList.get(i));
		}
		return resultList;
	}
	public Announcement insertAnnouncement(Announcement announcement){
		Session session = sessionFactory.getCurrentSession();
		session.persist(announcement);;
		return announcement;
	}
}

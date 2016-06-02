package com.tan.dao;

import java.util.HashMap;
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
import com.tan.model.Customer;
import com.tan.model.Employee;
import com.tan.model.Systeminfo;
import com.tan.model.Task;
import com.tan.util.SqlUtil;


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
	
	public List<Administrator> findByAdminName(String username) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("username", username);
		Iterator iterator = paramMap.entrySet().iterator();
		String jpql = SqlUtil.getSqlCondition(paramMap);
		TypedQuery query=  (TypedQuery) entityManager.createQuery("select obj from " + "administrator" + jpql);
		List<Administrator> resultList = ((javax.persistence.Query) query).getResultList();
		for(int i=0;i<resultList.size();i++)
		{
			System.out.println(resultList.get(i));
		}
		return resultList;
	}
	public Administrator insertAdministrator(Administrator administrator){
		Session session = sessionFactory.getCurrentSession();
		session.persist(administrator);;
		return administrator;
	}
	
	
	public Announcement insertAnnouncement(Announcement announcement){
		Session session = sessionFactory.getCurrentSession();
		session.persist(announcement);;
		return announcement;
	}
	
	public List<Announcement> getAnnouncements(){
		String hsql="from announcement";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hsql);
		return query.list();
	}
	
	public Task insertTast(Task task){
		Session session = sessionFactory.getCurrentSession();
		session.persist(task);
		return task;
	}
	
	public List<Task> getTasks(){
		String hsql="from task";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hsql);
		return query.list();
	}
	public List<Systeminfo> getSystemInfo(){
		String hsql="from systeminfo where idsysteminfo=1";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hsql);
		return query.list();
	}
	
	public void updateSysteInfo(Systeminfo systemInfo){
		Session session = sessionFactory.getCurrentSession();
		session.update(systemInfo);
	}
}

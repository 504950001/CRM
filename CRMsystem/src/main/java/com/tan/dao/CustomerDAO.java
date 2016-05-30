package com.tan.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.tan.model.Customer;
import com.tan.util.SqlUtil;

@Repository
public class CustomerDAO {
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
	
	public List<Customer> getAllCustomers(){
		String hsql="from customer";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hsql);
		return query.list();
	}
	
	public <T> List<T> findByCondition(Map<String, String> paramMap, Class<T> clazz) {
			Iterator iterator = paramMap.entrySet().iterator();
			String jpql = SqlUtil.getSqlCondition(paramMap);
			System.out.println("findByCondition jpql:"+jpql);
			//clazz.getSimpleName()
			TypedQuery<T> tQuery = entityManager.createQuery(
					"from " + "customer" + jpql, clazz);
			List<T> resultList = tQuery.getResultList();
			for(int i=0;i<resultList.size();i++)
			{
				System.out.println(resultList.get(i));
			}
			return resultList;
	}
	
	public List<Customer> findByID(String customerID) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("id", customerID);
		Iterator iterator = paramMap.entrySet().iterator();
		String jpql = SqlUtil.getSqlCondition(paramMap);
		Query query= (Query) entityManager.createQuery("select obj from " + "customer" + jpql);
		List<Customer> resultList = ((javax.persistence.Query) query).getResultList();
		for(int i=0;i<resultList.size();i++)
		{
			System.out.println(resultList.get(i));
		}
		return resultList;
}

	public Customer insertCustomer(Customer customer){
		Session session = sessionFactory.getCurrentSession();
		session.persist(customer);;
		return customer;
	}
	
	public Customer updateCustomer(Customer customer){
		Session session = sessionFactory.getCurrentSession();
		session.update(customer);
		return customer;
	}
	
	public Customer removeCustomer(Customer customer){
		Session session = sessionFactory.getCurrentSession();
		session.delete(customer);
		return customer;
	}
}

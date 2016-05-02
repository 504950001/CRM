package com.tan.dao;

import java.lang.annotation.Annotation;
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
import org.springframework.stereotype.Repository;

import com.tan.model.Employee;
import com.tan.util.SqlUtil;

@Repository
public class EmployeeDAO {
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
	
	public List<Employee> getAllEmployee(){
		String hsql="from employee";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hsql);
		return query.list();
	}
	
	public <T> List<T> findByCondition(Map<String, String> paramMap, Class<T> clazz) {
			Iterator iterator = paramMap.entrySet().iterator();//entrySet()的返回值也是返回一个entry集合
															  //Set entrySet(): 返回Map.Entry对象的视图集，即映像中的关键字/值对
			String jpql = SqlUtil.getSqlCondition(paramMap);
			System.out.println("findByCondition jpql:"+jpql);
			//clazz.getSimpleName()
			TypedQuery<T> tQuery = entityManager.createQuery(
					"from " + "employee" + jpql, clazz);
			List<T> resultList = tQuery.getResultList();
			for(int i=0;i<resultList.size();i++)
			{
				System.out.println(resultList.get(i));
			}
			return resultList;
	}
	
	public <T> List<T> findByID(String employeeID, Class<T> clazz) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("id", employeeID);
		Iterator iterator = paramMap.entrySet().iterator();
		String jpql = SqlUtil.getSqlCondition(paramMap);
		//clazz.getSimpleName()
		TypedQuery<T> tQuery = entityManager.createQuery(
				"select obj from " + "employee" + jpql, clazz);
		List<T> resultList = tQuery.getResultList();
		for(int i=0;i<resultList.size();i++)
		{
			System.out.println(resultList.get(i));
		}
		return resultList;
}

	public Employee insertEmployee(Employee employee){
		String hsql="from employee";
		Session session = sessionFactory.getCurrentSession();
		session.persist(employee);;
		return employee;
	}
}



//@Transactional
//public Employee addEmployee(Employee employee) {
//	System.out.println("跳转DAO的addEmployee函数");
//	System.out.println(employee.getId()+","+employee.getName()+","+employee.getPassword()+","
//	+employee.getSex()+","+employee.getTelephone()+","+employee.getEmail());
//	entityManager.persist(employee);
//	entityManager.flush();
//	entityManager.close();
//	return employee;
//}

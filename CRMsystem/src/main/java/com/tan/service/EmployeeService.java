package com.tan.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tan.dao.EmployeeDAO;
import com.tan.model.Employee;

@Service("employeeService")
public class EmployeeService {

	@Resource
	private EmployeeDAO employeeDao;
	
	@Transactional
	public int employeeCount(){
		return employeeDao.getAllEmployee().size();
	}

	public EmployeeDAO getEmployeeDao() {
		return employeeDao;
	}

	public void setEmployeeDao(EmployeeDAO employeeDao) {
		this.employeeDao = employeeDao;
	}


	//判定用户名和密码是否匹配
	public Employee loginCheck(String username, String password) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("name", username);
		paramMap.put("password", password);
		List<Employee> userList = employeeDao.findByCondition(paramMap, Employee.class);
		if (userList != null) {
			if (userList.size() >= 1) {
				return userList.get(0);
			} else {
				return null;
			}
		} else {
			return null;
		}
	}
//	判断id是否重复
	public boolean idEmpty(String id) {
		List<Employee> userList=employeeDao.findByID(id, Employee.class);
		System.out.println("userList.size()="+userList.size());
		if(userList.size()==0)
			return true;
		else
			return false;
	}
	@Transactional
	public boolean addEmployees(Employee employee) {
		System.out.println("跳转addEmployeesssss函数\nemployee.getId()="+employee.getId());

		if(idEmpty(employee.getId())){
			System.out.println("插入一条员工信息");
			employeeDao.insertEmployee(employee);
			return true;
		}
		else
			return false;
	}
}

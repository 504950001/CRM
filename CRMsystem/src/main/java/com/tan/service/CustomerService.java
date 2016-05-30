package com.tan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tan.dao.CustomerDAO;
import com.tan.model.Customer;
import com.tan.model.Employee;

@Service("customerService")
public class CustomerService {
	@Resource
	private CustomerDAO customerDao;
	
	public CustomerDAO getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDAO customerDao) {
		this.customerDao = customerDao;
	}
	
	@Transactional
	public int customerCount(){
		return customerDao.getAllCustomers().size();
	}

	@Transactional
	public List<Customer> customerList(){
		return customerDao.getAllCustomers();
	}
	
	//	判断id是否重复
	public boolean idEmpty(String id) {
		List<Customer> userList=customerDao.findByID(id);
		System.out.println("userList.size()="+userList.size());
		if(userList.size()==0)
			return true;
		else
			return false;
	}
	
	@Transactional
	public boolean addCustomer(Customer customer) {
		System.out.println("跳转addCustomer函数\naddCustomer.getId()="+customer.getId());

		if(idEmpty(customer.getId())){
			System.out.println("插入一条客户信息");
			customerDao.insertCustomer(customer);
			return true;
		}
		else
			return false;
	}
	
	//更新一位客户信息
	@Transactional
	public void refreshCustomer(Customer customer) {
		System.out.println("跳转refreshCustomer函数\n refreshCustomer.getId()="+customer.getId());
		customerDao.updateCustomer(customer);
	}
	
	//更新一位客户信息
	@Transactional
	public void deleteCustomer(Customer customer) {
		System.out.println("跳转refreshCustomer函数\n refreshCustomer.getId()="+customer.getId());
		customerDao.removeCustomer(customer);
	}

}

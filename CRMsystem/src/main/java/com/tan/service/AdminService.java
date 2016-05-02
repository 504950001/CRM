package com.tan.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tan.dao.AdminDAO;
import com.tan.model.Administrator;

@Service("adminService")
public class AdminService {
	
	@Resource
	private AdminDAO adminDao;
	
	@Transactional
	public int adminCount(){
		return adminDao.getAllAdmin().size();
	}
	

	public AdminDAO getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDAO adminDao) {
		this.adminDao = adminDao;
	}
	
	public Administrator loginCheck(String username, String password) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("username", username);
		paramMap.put("password", password);
		List<Administrator> userList = adminDao.findByCondition(paramMap, Administrator.class);
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
}

package com.tan.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tan.dao.AdminDAO;
import com.tan.model.Administrator;
import com.tan.model.Announcement;
import com.tan.model.Employee;
import com.tan.model.Task;

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
	
	@Transactional
	public boolean addAnnouncement(Announcement announcement) {
		System.out.println("跳转addAnnouncement函数\nannouncement.getIdannouncement()="+announcement.getIdannouncement());
		
		if(adminDao.insertAnnouncement(announcement)!=null){
			System.out.println("插入一条公告信息");
			adminDao.insertAnnouncement(announcement);
			return true;
		}
		else
			return false;
	}
	
	@Transactional
	public List<Announcement>  getAllannouncement() {
		System.out.println("获取所有公告通知信息：dao应该只关心数据的增删查改，不然service和dao的存在感觉意义不大");
		return adminDao.getAnnouncements();
	}
	
	@Transactional
	public void addTask(Task task) {
		System.out.println("跳转添加任务服务admin/addTask");
		adminDao.insertTast(task);
	}
	
	@Transactional
	public List<Task> taskList() {
		System.out.println("任务列表");
		return adminDao.getTasks();
	}
}

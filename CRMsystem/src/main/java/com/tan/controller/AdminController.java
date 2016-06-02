package com.tan.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.tan.model.Administrator;
import com.tan.model.Announcement;
import com.tan.model.Employee;
import com.tan.model.Report;
import com.tan.model.Systeminfo;
import com.tan.model.Task;
import com.tan.service.AdminService;
import com.tan.service.EmployeeService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService service;
	
	@Resource(name="employeeService")
	private EmployeeService serviceEmployee;
	
	@RequestMapping(value="/manager",method=RequestMethod.GET)
	public ModelAndView hello2(){
		System.out.println("hello springmvc");
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "hello springmvc");
		mv.setViewName("administrator");
		return mv;
	}

	
	@RequestMapping(value="/count",method=RequestMethod.GET)
	public ModelAndView count(){
		System.out.println("账号数目");
		int c = service.adminCount();
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", c);
		mv.setViewName("administrator");
		return mv;
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView loginCheck(@RequestParam("username") String username,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Administrator admin = service.loginCheck(username, password);
		if (admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("login_admin", admin);
			System.out.println(username+"登录成功");
			mv.addObject("message", "success登录成功！");
			mv.setViewName("index");
		} else {
			mv.addObject("message", "defeat登录失败！");
			mv.setViewName("administrator");
		}
		return mv;
	}
	
	@RequestMapping(value = "/isLogin", method = RequestMethod.POST)
	@ResponseBody
	public boolean isLogin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Administrator admin = (Administrator) session.getAttribute("login_admin");
		return admin != null ? true : false;
	}
	
	@RequestMapping("/login")
	public String logIn(HttpServletRequest request) {
		System.out.println("登录视图");
		HttpSession session = request.getSession();
		Administrator admin = (Administrator) session.getAttribute("login_admin");
		if(admin != null)
			return "index";
		else
			return "login";
	}
	
	@RequestMapping("/logout")
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("login_admin");
		System.out.println("退出登录视图");
		return "login";
	}
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public ModelAndView getIndex(){
		System.out.println("跳转到公告通知视图");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping(value="/announcement",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getAnnouncement(@RequestParam("title") String title,@RequestParam(value="datatime",required=true) String date,@RequestParam(value="myContent",required=true) String content){
		System.out.println("提交公告通知");
		ModelAndView mv = new ModelAndView();
		Announcement announcement=new Announcement();
		//announcement.setIdannouncement(007);id已在bean注解中设置自动增长
		announcement.setTitle(title);
		announcement.setDate(date);
		announcement.setContent(content);
		mv.setViewName("administrator");
		if(service.addAnnouncement(announcement)){
			mv.addObject("message", "title:"+title+",\n date:"+date+",\n content:"+content);
		}
		else
			mv.addObject("message", "插入公告通知失败！");
		return mv;
	}
	
	//手机获取公告通知列表
	@RequestMapping(value="/announcementList",method=RequestMethod.POST)
	@ResponseBody
	public String announcementList(HttpServletResponse response){
		response.setContentType("text/html; charset=utf-8"); 
		List<Announcement> announcements=service.getAllannouncement();
		String announcementsString = JSON.toJSONString(announcements);
		System.out.println("announcementsString="+announcementsString);
		return announcementsString;
		
	}
	
	@RequestMapping(value="/manage-permission",method=RequestMethod.GET)
	public ModelAndView getManage_permission(){
		System.out.println("跳转到权限管理视图");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage-permission");
		return mv;
	}
	
	@RequestMapping(value="/manage-system",method=RequestMethod.GET)
	public ModelAndView getManage_system(){
		System.out.println("跳转到系统管理视图");
		ModelAndView mv =new ModelAndView("manage-system");
		Systeminfo sysInfo=service.systemInfoList();
		mv.addObject("systemInfo",sysInfo);
		return mv;
	}
	@RequestMapping(value="/updateSystemInfo",method=RequestMethod.POST)
	public ModelAndView updateManage_system(@RequestParam("sysName") String sysName,@RequestParam("version") String version,
			@RequestParam("person") String person,@RequestParam("email") String email,HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("更新系统管理");
		ModelAndView mv =new ModelAndView();
		Systeminfo sysinfo=new Systeminfo();
		sysinfo.setIdsystemInfo(1);
		sysinfo.setSystemName(sysName);
		sysinfo.setSysVersion(version);
		sysinfo.setPerson(person);
		sysinfo.setEmail(email);
		service.updateSystemInfo(sysinfo);
		//由于返回视图不自动跳转到manage-system视图，仍停留在updateSystemInfo，所以用response发送
		response.sendRedirect(request.getContextPath()+"/admin/manage-system");
		mv.setViewName("manage-system");
		return mv;
	}
	
	@RequestMapping(value="/manage-user",method=RequestMethod.GET)
	public ModelAndView getManage_user(){
		System.out.println("跳转到用户管理视图");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manage-user");
		return mv;
	}
	
	
	@RequestMapping(value="/accountRegister",method=RequestMethod.GET)
	public ModelAndView getAccountRegister(){
		System.out.println("跳转到账号开通视图");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("accountRegister");
		return mv;
	}
	
	@RequestMapping(value="/employeeReport",method=RequestMethod.GET)
	public ModelAndView getEmployeeReport(){
		System.out.println("跳转到员工汇报视图");
		ModelAndView mv = new ModelAndView();
		List<Report> reportList=serviceEmployee.reportList();
		mv.addObject("reportList", reportList);
		mv.setViewName("employeeReport");
		return mv;
	}
	
	@RequestMapping(value="/deleteReport",method=RequestMethod.POST)
	public ModelAndView deleteTask(@RequestParam("idreport") int idreport,
			@RequestParam("title") String title,@RequestParam("author") String author,@RequestParam("content") String content){
		System.out.println("管理员删除任务");
		ModelAndView mv = new ModelAndView();
		Report report=new Report();
		report.setIdreport(idreport);
		report.setTitle(title);
		report.setAuthor(author);
		report.setContent(content);
		serviceEmployee.deleteReport(report);
		List<Report> reportList=serviceEmployee.reportList();
		mv.addObject("reportList", reportList);
		mv.setViewName("employeeReport");
		return mv;
	}
	
	@RequestMapping(value="/taskPublish",method=RequestMethod.GET)
	public ModelAndView getTaskPublish(){
		System.out.println("跳转到任务发布视图/获取员工列表引入@Resource(name=‘employeeService’)\n private EmployeeService serviceEmployee;");
		ModelAndView mv = new ModelAndView();
		List<Employee> employeeList=serviceEmployee.employeeList();
		//String employeeString = JSON.toJSONString(employeeList);
		mv.addObject("employeeList", employeeList);
		mv.setViewName("taskPublish");
		return mv;
	}
	
	@RequestMapping(value="/addTask",method=RequestMethod.POST)
	public ModelAndView addTask(@RequestParam("title") String title,@RequestParam("datatime") String date,
			@RequestParam("employeeName") String employeeName,@RequestParam("myContent") String content,
			HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("管理员添加任务");
		ModelAndView mv = new ModelAndView();
		Task task=new Task();
		task.setTitle(title);
		task.setDate(date);
		task.setEmployeeName(employeeName);
		task.setContent(content);
		service.addTask(task);
		response.sendRedirect(request.getContextPath()+"/admin/taskPublish");
		mv.setViewName("taskPublish");
		return mv;
	}
	
	//手机获取任务列表
	@RequestMapping(value="/taskList",method=RequestMethod.POST)
	@ResponseBody
	public String taskList(@RequestParam("employeeInfo") String employeeInfo,HttpServletResponse response){
		response.setContentType("text/html; charset=utf-8"); 
		List<Task> task=service.taskList();
		List<Task> taskList =  new ArrayList<Task>();//筛选后的列表
		for(int i=0;i<task.size();i++){
		 	 String employeeName=task.get(i).getEmployeeName();
		 	 if(employeeName.contains(employeeInfo)){
		 		taskList.add(task.get(i));
		 	 }
		}
		String tasksString = JSON.toJSONString(taskList);
		System.out.println("tasksString="+tasksString);
		return tasksString;
	}
	
	@RequestMapping(value="/addAdmin",method=RequestMethod.POST)
	public ModelAndView addAdmin(@RequestParam("username") String username,@RequestParam("password") String password,
			HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("添加管理员信息");
		ModelAndView mv = new ModelAndView();
		Administrator admin=new Administrator();
		admin.setUsername(username);
		admin.setPassword(password);
		if(service.addAdmin(admin)){
			mv.setViewName("manage-permission");
			//response.sendRedirect(request.getContextPath()+"/admin/manage-permission");
		}
		else{
			mv.addObject("message", "账户已存在，创建管理员账户失败");
			mv.setViewName("administrator");
		}
		return mv;
	}

}

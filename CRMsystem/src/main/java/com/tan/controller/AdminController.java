package com.tan.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tan.model.Administrator;
import com.tan.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService service;
	
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
		ModelAndView mv = new ModelAndView();
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
	
	@RequestMapping(value="/customerInformation",method=RequestMethod.GET)
	public ModelAndView getCustomerInformation(){
		System.out.println("跳转到客户信息视图");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customerInformation");
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
		mv.setViewName("employeeReport");
		return mv;
	}
	
	@RequestMapping(value="/taskPublish",method=RequestMethod.GET)
	public ModelAndView getTaskPublish(){
		System.out.println("跳转到任务发布视图");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("taskPublish");
		return mv;
	}
}

package com.tan.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tan.model.Employee;
import com.tan.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Resource(name="employeeService")
	private EmployeeService service;
	
	@RequestMapping(value="/count",method=RequestMethod.GET)
	public ModelAndView count(){
		System.out.println("员工账号数目");
		int c = service.employeeCount();
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", c);
		mv.setViewName("administrator");
		return mv;
	}
//	@responsebody表示该方法的返回结果直接写入HTTP response body中
//	一般在异步获取数据时使用，在使用@RequestMapping后，返回值通常解析为跳转路径，
//	加上@responsebody后返回结果不会被解析为跳转路径，而是直接写入HTTP response body中。
//	比如异步获取json数据，加上@responsebody后，会直接返回json数据。
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView loginCheck(@RequestParam("username") String username,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Employee employee = service.loginCheck(username, password);
		
		if (employee != null) {
			mv.addObject("message", username+","+password);
		} else {
			mv.addObject("message", "defeat登录失败！");
		}
		mv.setViewName("employee");
		return mv;
	}
	
	@RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addEmployee(@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("password") String password,
			@RequestParam("password2") String password2,
			@RequestParam("sex") String sex,
			@RequestParam("telephone") String telephone,
			@RequestParam("email") String email,
			HttpServletRequest request) {
		System.out.println("跳转到employee视图");
		ModelAndView mv = new ModelAndView();
		Employee employee=new Employee();
		employee.setId(id);
		employee.setName(name);
		employee.setPassword(password);
		employee.setSex(sex);
		employee.setEmail(email);
		employee.setTelephone(telephone);
//		if(service.idEmpty(id)&&password.equals(password2)){
		if(service.idEmpty(id)){
			service.addEmployees(employee);
			System.out.println("service.addEmployees(employee)="+service.addEmployees(employee));
			mv.addObject("message", "id="+id);
		}
		else{
			mv.addObject("message", "defeat！id已存在");
		}
			
		mv.setViewName("administrator");
		return mv;
	}
}

package com.tan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSON;

import com.tan.model.Customer;
import com.tan.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Resource(name = "customerService")
	private CustomerService customerService;

	@RequestMapping(value = "/customerList", method = RequestMethod.GET)
	public ModelAndView customerList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("客户列表");
		List<Customer> customerList = customerService.customerList();
		String customerString = JSON.toJSONString(customerList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("cList", customerList);
		mv.addObject("message", "message success");
		mv.setViewName("customerInformation");
		System.out.println("customerString=" + customerString);
		// response.setCharacterEncoding("UTF-8");
		return mv;
	}

	@RequestMapping(value = "/customerListTel", method = RequestMethod.POST)
	@ResponseBody
	public String customerListTel(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("手机获取客户列表");
		List<Customer> customerList = customerService.customerList();
		String customerString = JSON.toJSONString(customerList);
		System.out.println(customerString);
		return customerString;
	}
	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addcustomer(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("sex") String sex, @RequestParam("telephone") String telephone,
			@RequestParam("email") String email, @RequestParam("address") String address, HttpServletRequest request,HttpServletResponse response) throws IOException {
		System.out.println("跳转到customer视图");
		ModelAndView mv = new ModelAndView();
		Customer customer = new Customer();
		customer.setId(id);
		customer.setName(name);
		customer.setSex(sex);
		customer.setEmail(email);
		customer.setTelephone(telephone);
		if (customerService.idEmpty(id)) {
			customerService.addCustomer(customer);
			System.out.println("service.addcustomers(customer)=" + customerService.addCustomer(customer));
			response.sendRedirect(request.getContextPath()+"/customer/customerList");
			//mv.addObject("message", "id=" + id);
		} else {
			mv.addObject("message", "defeat！id已存在或为空");
		}

		mv.setViewName("administrator");
		return mv;
	}
	
	@RequestMapping(value = "/updateCustomer", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateCustomer(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("sex") String sex, @RequestParam("telephone") String telephone,
			@RequestParam("email") String email, @RequestParam("address") String address, HttpServletRequest request,HttpServletResponse response) {
		System.out.println("跳转到customer更新视图"+id+name+sex+email+telephone+address);
		ModelAndView mv = new ModelAndView();
		Customer customer = new Customer();
		customer.setId(id);
		customer.setName(name);
		customer.setSex(sex);
		customer.setEmail(email);
		customer.setTelephone(telephone);
		customer.setAddress(address);
		customerService.refreshCustomer(customer);
	    mv.addObject("message", "更新了客户_"+name+"_的信息");
		mv.setViewName("administrator");
		try {
	    	//直接进行URL跳转而非视图跳转
			response.sendRedirect(request.getContextPath()+"/customer/customerList");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "/deleteCustomer", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView deleteCustomer(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("sex") String sex, @RequestParam("telephone") String telephone,
			@RequestParam("email") String email, @RequestParam("address") String address, HttpServletRequest request,HttpServletResponse response) {
		System.out.println("跳转到customer删除视图");
		ModelAndView mv = new ModelAndView();
		Customer customer = new Customer();
		customer.setId(id);
		customer.setName(name);
		customer.setSex(sex);
		customer.setEmail(email);
		customer.setTelephone(telephone);
		customer.setAddress(address);
		customerService.deleteCustomer(customer);
	    mv.addObject("message", "删除客户"+name+"_的信息");
 		mv.setViewName("administrator");
	    try {
	    	//直接进行URL跳转而非视图跳转
			response.sendRedirect(request.getContextPath()+"/customer/customerList");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
}

// request.setHeader("Charset","UTF-8");
// request.setContentType("text/html;charset=UTF-8");

// try {
//// java.net.URLEncoder.encode(customerString,"UTF-8");
// customerString=java.net.URLDecoder.decode(customerString, "UTF-8");
//
// } catch (UnsupportedEncodingException e) {
//// TODO Auto-generated catch block
// e.printStackTrace();
// }

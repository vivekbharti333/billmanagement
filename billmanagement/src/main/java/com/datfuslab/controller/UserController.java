package com.datfuslab.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class UserController {
	
	@Autowired
	public HttpServletRequest request;
	
	@RequestMapping(value = "/")
	public ModelAndView test(HttpServletResponse response) throws IOException {
		
		return new ModelAndView("index");
	}
	
	
	@RequestMapping(value = "version")
	public String version(HttpServletResponse response) throws IOException {
		return "1.2";
	}

//	@Scheduled(fixedDelay = 5000)
	@RequestMapping(path = "test", method = RequestMethod.GET)
	public String test() throws Exception {
		
		String clientIp = request.getHeader("X-Forwarded-For") != null ? request.getHeader("X-Forwarded-For") : request.getRemoteAddr();
		
	return "Working : "+clientIp;
	}

}

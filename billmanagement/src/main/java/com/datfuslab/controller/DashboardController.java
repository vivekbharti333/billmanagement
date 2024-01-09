package com.datfuslab.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@CrossOrigin(origins = "*")
@RestController
public class DashboardController {
	
	@Autowired
	public HttpServletRequest request;
	
	@RequestMapping(value = "dashboard")
	public ModelAndView dashboard(HttpServletResponse response) throws IOException {
		return new ModelAndView("dashboard");
	}
	
	@RequestMapping(value = "/")
	public ModelAndView login(HttpServletResponse response) throws IOException {
		return new ModelAndView("login");
	}
	
	
	

}

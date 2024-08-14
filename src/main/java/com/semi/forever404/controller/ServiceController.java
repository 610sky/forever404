package com.semi.forever404.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.forever404.Forever404Application;
import com.semi.forever404.service.ServiceService;

@Controller
public class ServiceController {
	@Autowired
	private ServiceService service;
	
	@ResponseBody
	@GetMapping("/addinfo")
	public void addInfo(String type, String title, String addr, String lat, String lng, String phone) {
		try {
			service.addInfo(type, title, addr, lat, lng, phone);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
	}
}

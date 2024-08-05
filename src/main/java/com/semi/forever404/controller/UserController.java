package com.semi.forever404.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.forever404.model.vo.User;
import com.semi.forever404.service.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	@GetMapping("/album")
	public String album() {
		return "album";
	}
	
	@PostMapping("/register")
	public String register(String id, String password, String phone, String name, String email, @RequestParam(name="birth", required=false) String birth) {
			System.out.println(birth);
		try {
			if(!birth.equals("")) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = formatter.parse(birth);
			User user = new User(id, password, phone, name, email, date);
			service.register(user);
			} else {
				User user = new User(id, password, phone, name, email);
				service.register(user);
			}
			
		} catch (ParseException e) {}
		return "redirect:/";
	}
}

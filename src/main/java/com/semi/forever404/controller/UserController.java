package com.semi.forever404.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.forever404.model.vo.User;
import com.semi.forever404.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
	
	@PostMapping("/register")
	public String register(String id, String password, String phone, String name, String email, @RequestParam(name="birth", required=false) String birth) {
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
	
	@PostMapping("/login")
		public String login(HttpServletRequest request, User user) {
			HttpSession session = request.getSession();
			session.setAttribute("user", service.login(user));
			return "redirect:/main";
		}
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user")!=null) {
		session.invalidate();
		return "redirect:/";
		}
		return "main";
	}
	@PostMapping("/register/kakao")
	public String kakaoLogin(@RequestParam("email") String email,
						   @RequestParam("name") String name,
						   @RequestParam("phone") String phone,
						   @RequestParam("birthday") String birthday,
						   @RequestParam("birthyear") String birthyear,
						   @RequestParam("token") String token,
						   HttpServletRequest request,
						   User user
							) throws ParseException {
		String month = birthday.substring(0, 2);
		String day = birthday.substring(2, 4);
		String birth = birthyear + "-" + month + "-" + day;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(birth);
		String newphone = phone.replace("+82 ", "0");
		User existingUser = service.kakaoLogin(email);
		if(existingUser !=null) {
			 HttpSession session = request.getSession();
			 session.setAttribute("user", existingUser);
			 System.out.println("기존 정보가 존재할경우만 뜨는 문구");
			 return "redirect:/main";
		}else if(existingUser == null){
			 user = new User(email, token, newphone, name, email, date);
			 service.register(user);
			 System.out.println("기존 정보가 존재하지 않을 경우 뜨는 문구");
			 HttpSession session = request.getSession();
			 session.setAttribute("user", user);
		}
		return "redirect:/main";
	}
	
	@GetMapping("/main")
	public String main(HttpServletRequest request, User user, Model model) {
		// ajax ->> session 담겨져 있고..!
		
		HttpSession session = request.getSession();
	    user = (User) session.getAttribute("user");
	    System.out.println(user);
	    if(user!=null) {
	    	System.out.println("user");
	    	model.addAttribute("user", user);
	    }else if(user==null){
	    	System.out.println("!");
	    	return "redirect:/";
	    }
	    System.out.println("처리");
		return "main";
	}
}

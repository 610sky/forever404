package com.semi.forever404.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.forever404.model.vo.User;
import com.semi.forever404.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	
	@ResponseBody
	@PostMapping("/signUp")
	public void signUp(String id, String password, String phone, String name, String email, @RequestParam(name="birth", required=false) String birth) throws ParseException {
			if(!(birth.equals(""))) {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date date = formatter.parse(birth);
				User user = new User(id, password, phone, name, email, date);
				service.register(user);
			} else if(birth.equals("")){
				User user = new User(id, password, phone, name, email, null);
				service.register(user);
			}
	}
	@ResponseBody
	@PostMapping("/login")
		public boolean login(HttpServletRequest request, User user) {
			HttpSession session = request.getSession();
			session.setAttribute("user", service.login(user));
			if(session.getAttribute("user")!=null) return true;
			else return false;
		}
	
	// check!
	@ResponseBody
	@PostMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user")!=null) {
		session.invalidate();
		}
	}	
	// check
	/*@PostMapping("/register")
	public String register(String id, String password, String phone, String name, String email, @RequestParam(name="birth", required=false) String birth) {
		try {
			if(!birth.equals("")) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
			Date date = formatter.parse(birth);
			User user = new User(id, password, phone, name, email, date);
			service.register(user);
			} else {
				User user = new User(id, password, phone, name, email, null);
				service.register(user);
			}
		} catch (ParseException e) {} 
		return "main";
	}*/
	@ResponseBody
	@PostMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam("email") String email,
						   @RequestParam("name") String name,
						   @RequestParam("phone") String phone,
						   @RequestParam("birthday") String birthday,
						   @RequestParam("birthyear") String birthyear,
						   @RequestParam("token") String token,
						   HttpServletRequest request,
						   User user,
						   Model model
							) throws ParseException {
		
		String month = birthday.substring(0, 2);
		String day = birthday.substring(2, 4);
		String birth = birthyear + "-" + month + "-" + day;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(birth);
		HttpSession session = request.getSession();
		session.setAttribute("token", token);
		String newphone = phone.replace("+82 ", "0");
		User existingUser = service.kakaoLogin(email);
		if(existingUser !=null) {
			 
			 session.setAttribute("user", existingUser);
			 System.out.println("기존 정보가 존재할경우만 뜨는 문구");
			 return "main";
		}else {
			 user = new User(email, token, newphone, name, email, date);
			 service.register(user);
			 System.out.println("기존 정보가 존재하지 않을 경우 뜨는 문구");
			 session.setAttribute("user", user);
			 return "main";
		}
		 
	}
	
	@ResponseBody
	@PostMapping("/myPage")
	public User myPage(User user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		user = (User) session.getAttribute("user");
		return user;
	}
	
	
}

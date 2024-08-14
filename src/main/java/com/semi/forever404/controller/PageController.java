package com.semi.forever404.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	@GetMapping("/developer")
	public String developer() {
		return "developer";
	}
}

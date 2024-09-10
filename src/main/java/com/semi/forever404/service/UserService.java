package com.semi.forever404.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.forever404.model.vo.User;

import mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserMapper mapper;
	
	public void register(User user) {
		mapper.register(user);
	}
	public User login(User user) {
		return mapper.login(user);
	}
	public User kakaoLogin(String email) {
		return mapper.kakaoLogin(email);
	}
	public User myPage(User user) {
		return mapper.myPage(user);
	}
}

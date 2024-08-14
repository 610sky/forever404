package com.semi.forever404.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class User {
	private String id;
	private String password;
	private String phone;
	private String name;
	private String email;
	private Date birth;
	
	public User(String id) {
		this.id=id;
	}
	
}

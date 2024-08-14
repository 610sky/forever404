package com.semi.forever404.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class SmallGroup {
	private int smGroupCode;
	private int moneyPerUser;
	private User user; // 여기서 id를 가져와야함
	private BigGroup bigGroup; // 여기서 코드를 가져와야함
	
	public SmallGroup(User user, BigGroup bigGroup) {
		this.bigGroup = bigGroup;
		this.user = user;
	}
}


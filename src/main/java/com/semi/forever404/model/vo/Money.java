package com.semi.forever404.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Money {
	private int mCode;
	private int useMoney;
	private String buyingList;
	private SmallSchedule smallSchedule;
	
	public Money(SmallSchedule smallSchedule) {
		this.smallSchedule = smallSchedule;
	}
	
}

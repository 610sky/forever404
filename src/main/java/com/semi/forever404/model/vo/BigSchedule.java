package com.semi.forever404.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class BigSchedule {
	private int bsCode;
	private BigGroup bigGroup;
	private User user;
	private Date startDate;
	private Date endDate;
	private String title;
	private int entireMoney;
	private String scheduleColor;
	
	public BigSchedule(BigGroup bg, User u) {
		this.bigGroup=bg;
		this.user=u;
	}
	public BigSchedule (String title) {
		this.title = title;
	}
}

package com.semi.forever404.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class SmallSchedule {
	private String groupName;
	private int ssCode;
	private String memo;
	private String items;
	private char isReservation;
	private BigSchedule bigSchedule;

	public SmallSchedule(String memo, String items, char isReservation, BigSchedule bigSchedule) {
		this.memo = memo;
		this.items = items;
		this.isReservation = isReservation;
		this.bigSchedule = bigSchedule;
	}

}

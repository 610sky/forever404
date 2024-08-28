package com.semi.forever404.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class SmallSchedule {
	private int ssCode;
	private String memo;
	private char isReservation;
	private int leftMoney;
	private String curDate;
	private String curTime;
	private BigSchedule bigSchedule;
	private String serviceName;
	private String serviceJibun;
	private Double serviceLat;
	private Double serviceLng;
	private String servicePhone;
	private String serviceImg;
	
	public SmallSchedule(BigSchedule bigSchedule) {
		this.bigSchedule = bigSchedule;
	}
	
}

package com.semi.forever404.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Photo {
	private int photoCode;
	private String photoUrl;
	private BigSchedule bigSchedule;
	
	
	public Photo(String photoUrl, BigSchedule bigSchedule) {
		this.photoUrl = photoUrl;
		this.bigSchedule = bigSchedule;
	}
	
}

package com.semi.forever404.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class BigGroup {
	private int bgGroupCode;
	private String groupName;
	private int money;
	
	public BigGroup(int bgGroupCode) {
		this.bgGroupCode = bgGroupCode;
	}
}

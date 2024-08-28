package com.semi.forever404.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class ServiceInfo {
	private int siCode;
	private String serviceName;
	private String serviceJibun;
	private Double serviceLat;
	private Double serviceLng;
	private String servicePhone;
	private String serviceImg;
	
	
	public ServiceInfo(String serviceName, String serviceJibun, Double serviceLat, Double serviceLng,
			String servicePhone, String serviceImg) {
		super();
		this.serviceName = serviceName;
		this.serviceJibun = serviceJibun;
		this.serviceLat = serviceLat;
		this.serviceLng = serviceLng;
		this.servicePhone = servicePhone;
		this.serviceImg = serviceImg;
	}
}

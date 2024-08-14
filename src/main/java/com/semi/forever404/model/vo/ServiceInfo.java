package com.semi.forever404.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class ServiceInfo {
	private int siCode;
	private String siType;
	private String serviceName;
	private String serviceJibun;
	private Double seviceLat;
	private Double serviceLNG;
	private String servicePhone;
	private String serviceImg;
}

package com.semi.forever404;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan ("mapper")
public class Forever404Application {

	public static void main(String[] args) throws InterruptedException {
		SpringApplication.run(Forever404Application.class, args);
	}

}

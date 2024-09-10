package com.semi.forever404.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.semi.forever404.model.vo.BigSchedule;
import com.semi.forever404.model.vo.Photo;
import com.semi.forever404.service.GroupService;

@Controller
public class ScheduleController {
	
	private String path = "\\\\192.168.10.28\\forever404\\storage\\";
	
	@Autowired
	private GroupService service;
	
	// 공용 폴더 + 데이터베이스 사진 추가
	@ResponseBody
	@PostMapping("/testupload")
	public void testupload(List<MultipartFile> files, String bsCode) throws IllegalStateException, IOException {
		Photo photo;
		
		int code = Integer.parseInt(bsCode);
		for(MultipartFile f : files) {
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString() + "_" + f.getOriginalFilename();
			File file = new File(path + fileName);
			f.transferTo(file);
			
			String url = "http://192.168.10.28:8080/storage/" + fileName;
			BigSchedule bg = new BigSchedule();
			bg.setBsCode(code);
			photo = new Photo(url, bg);
			service.imgLoad(photo);
		}
	}
	
}

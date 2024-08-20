package com.semi.forever404.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.forever404.model.vo.BigGroup;
import com.semi.forever404.model.vo.BigSchedule;
import com.semi.forever404.model.vo.SmallGroup;
import com.semi.forever404.model.vo.SmallSchedule;
import com.semi.forever404.model.vo.User;
import com.semi.forever404.service.GroupService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class GroupController {
	@Autowired
	private GroupService service;
	
	@ResponseBody
	@PostMapping("/addGroup")
	public boolean addGroup(BigGroup bigGroup, String groupName, HttpServletRequest request) {
			List<BigGroup> list = service.userGroup();
			System.out.println(list);
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			service.addGroup(bigGroup);
			BigGroup bg = service.searchBgCode(groupName);
			String id =user.getId();
			int bgGroupCode = bg.getBgGroupCode();
			SmallGroup smGroup = new SmallGroup(new User(id), new BigGroup(bgGroupCode));
			service.addSmGroup(smGroup);
			return true;
	}
	
	@ResponseBody
	@PostMapping("/userGroup")
	public List<SmallGroup> userGroup(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String id =user.getId();
		List<SmallGroup> list = service.allInfoGroup(id);
		model.addAttribute("list", list);
		return list;
	}
	@ResponseBody
	@PostMapping("/selectGroup")
	public String selectGroup(HttpServletRequest request,String groupName) {
		HttpSession session = request.getSession();
		session.setAttribute("groupName", groupName);
		System.out.println(session.getAttribute("groupName"));
		return (String) session.getAttribute("groupName");
	}
	
	@ResponseBody
	@PostMapping("/scheduleAdd")
	public void schduleAdd(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String groupName = (String) session.getAttribute("groupName");
		User user = (User) session.getAttribute("user");
		String id = user.getId();
		BigGroup bg = service.searchBgCode(groupName);
		BigSchedule bgs = new BigSchedule(bg, new User(id));
		service.scheduleAdd(bgs);
	}
	
	@ResponseBody
	@PostMapping("/scheduleAdd2")
	public void scheduleAdd2(HttpServletRequest request, SmallSchedule schedule) {
		HttpSession session = request.getSession();
		String groupName = (String) session.getAttribute("groupName");
		System.out.println(groupName);
		BigGroup bg = service.searchBgCode(groupName);
		int num = bg.getBgGroupCode();
		BigSchedule bgs = service.searchBsCode(num);
		System.out.println(bgs);
		service.scheduleAdd2(new SmallSchedule(schedule.getMemo(), schedule.getItems(), schedule.getIsReservation(), bgs));
	}

}

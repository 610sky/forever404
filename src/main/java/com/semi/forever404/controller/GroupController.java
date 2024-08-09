package com.semi.forever404.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.forever404.model.vo.BigGroup;
import com.semi.forever404.model.vo.SmallGroup;
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
			for(BigGroup group : list) {
				String name = group.getGroupName();
				if(name.equals(groupName)) {
					return false;
				}
			}
			service.addGroup(bigGroup);
			BigGroup bg = service.searchBgCode(groupName);
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			String id =user.getId();
			int bgGroupCode = bg.getBgGroupCode();
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
}

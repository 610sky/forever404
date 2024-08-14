package com.semi.forever404.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.forever404.model.vo.BigGroup;
import com.semi.forever404.model.vo.BigSchedule;
import com.semi.forever404.model.vo.SmallGroup;

import mapper.GroupMapper;

@Service
public class GroupService {
	@Autowired
	private GroupMapper mapper;
	
	public void addGroup(BigGroup bigGroup) {
		mapper.addGroup(bigGroup);
	}
	public void addSmGroup(SmallGroup smallGroup) {
		mapper.addSmGroup(smallGroup);
	}
	public BigGroup searchBgCode(String groupName) {
		return mapper.searchBgCode(groupName);
	}
	public List<BigGroup> userGroup() {
		return mapper.userGroup();
	}
	public List<SmallGroup> allInfoGroup(String id) {
		return mapper.allInfoGroup(id);
	}
	
	// 스케줄 관련
	public void scheduleAdd(BigSchedule bgs) {
		mapper.scheduleAdd(bgs);
	}
}

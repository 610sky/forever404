package com.semi.forever404.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.forever404.model.vo.BigGroup;
import com.semi.forever404.model.vo.BigSchedule;
import com.semi.forever404.model.vo.Money;
import com.semi.forever404.model.vo.Photo;
import com.semi.forever404.model.vo.SmallGroup;
import com.semi.forever404.model.vo.SmallSchedule;
import com.semi.forever404.model.vo.Tip;

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
	
	public List<SmallGroup> selectSmallGroup(String id) {
		return mapper.selectSmallGroup(id);
	}
	
	// 한 그룹에 여러 회원
	public List<SmallGroup> selectSmallGroup2(int num) {
		return mapper.selectSmallGroup2(num);
	}
	public List<SmallGroup> allInfoGroup(String id) {
		return mapper.allInfoGroup(id);
	}
	
	// 스케줄 관련
	public void scheduleAdd(BigSchedule bgs) {
		mapper.scheduleAdd(bgs);
	}
	public void scheduleAdd2(SmallSchedule sgs) {
		mapper.scheduleAdd2(sgs);
	}
	
	public List<BigSchedule> searchBsCode(int num) {
		return mapper.searchBsCode(num);
	}
	
	public List<BigSchedule> selectBg(BigSchedule bs) {
		return mapper.selectBg(bs);
	}
	public List<SmallSchedule> selectSc(BigSchedule bs) {
		return mapper.selectSc(bs);
	}
		
	public List<SmallSchedule> selectOneSc(int num) {
		return mapper.selectOneSc(num);
	}
	
	public BigSchedule selectOneBs(int num) {
		return mapper.selectOneBs(num);
	}
	
	public List<Money> selectMoney(int num) {
		return mapper.selectMoney(num);
	}
	
	public void insertMoney(Money money) {
		mapper.insertMoney(money);
	}
	
	//그룹 삭제
	public void deleteGroup1 (int num) {
		mapper.deleteGroup1(num);
	}
	public void deleteGroup2 (int num) {
		mapper.deleteGroup2(num);
	}
	public void deleteGroup3 (int num) {
		mapper.deleteGroup3(num);
	}
	public void deleteGroup4 (int num) {
		mapper.deleteGroup4(num);
	}
	public void deleteGroup5 (int num) {
		mapper.deleteGroup5(num);
	}
	
	// 금액 삭제
	public void deleteM(int mCode) {
		mapper.deleteM(mCode);
	}
	
	
	// 세부 스케줄 삭제
	public void deleteSc(int ssCode) {
		mapper.deleteSc(ssCode);
	}
	
	// 전체 일정 삭제
	public void deleteBs(int bsCode) {
		mapper.deleteBs(bsCode);
	}
	
	// 이미지 추가 및 선택
	public void imgLoad (Photo photo) {
		mapper.imgLoad(photo);
	}
	public List<Photo> selectMyImg(int num) {
		return mapper.selectMyImg(num);
	}
	
	// 이미지 삭제
	public void deleteImg(int photoCode) {
		mapper.deleteImg(photoCode);
	}
	public void deleteAllImg(int groupCode) {
		mapper.deleteAllImg(groupCode);
	}
	public Map<String, Object> getDateRange(int bsCode) {
		return mapper.getDateRange(bsCode);
	}
	public List<Map<String, Object>> getDateList(String stdDate, String endDate) {
		 Map<String, Object> paramMap = new HashMap<>();
	        paramMap.put("stdDate", stdDate);
	        paramMap.put("endDate", endDate);
	        return mapper.getDatesList(paramMap);
	}

	//팁 가져오기
	public List<Tip> tip() {
		return mapper.tip();
	}
}

package com.semi.forever404.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.openqa.selenium.NoSuchElementException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.forever404.model.vo.BigGroup;
import com.semi.forever404.model.vo.BigSchedule;
import com.semi.forever404.model.vo.Money;
import com.semi.forever404.model.vo.SmallGroup;
import com.semi.forever404.model.vo.SmallSchedule;
import com.semi.forever404.model.vo.User;
import com.semi.forever404.service.GroupService;
import com.semi.forever404.service.ServiceService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService service;
	
	@Autowired
	private ServiceService crawling;
	
	// 그룹 추가
	@ResponseBody
	@PostMapping("/addGroup")
	public boolean addGroup(BigGroup bigGroup, String groupName, HttpServletRequest request) {
			List<BigGroup> list = service.userGroup();	// 모든 big_group 테이블 가져옴
			for(BigGroup bg : list) {
				if(groupName.equals(bg.getGroupName()) && bg!=null) {
					return false;	// 반복문 이용해서 입력받은 그룹명과 기존에 존재하는 그룹들의 이름 중 하나라도 같으면 false 리턴
				}
			}
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if(!bigGroup.getGroupName().equals("") && !bigGroup.getGroupName().contains(" ")) {
				service.addGroup(bigGroup);
				BigGroup bg = service.searchBgCode(groupName);
				String id =user.getId();
				int bgGroupCode = bg.getBgGroupCode();
				SmallGroup smGroup = new SmallGroup(new User(id), new BigGroup(bgGroupCode));
				service.addSmGroup(smGroup);
				return true;
			} else return false;
	}
	
	// 특정 id 컬럼값을 가진 small_group 가져오기
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
	
	// 그룹 참여
	@ResponseBody
	@PostMapping("/attendGroup")
	public boolean attendGroup(HttpServletRequest request, String groupName) {
		BigGroup bg = service.searchBgCode(groupName);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		int check = 0;
		List<SmallGroup> list = service.selectSmallGroup(user.getId());
		if(bg != null) {
			for(SmallGroup sm : list) {
				if(sm.getBigGroup().getBgGroupCode() == bg.getBgGroupCode()) {
					check = 1;
					break;
				} 
			}
			if(check == 1) {
				return false;
			} else {
				SmallGroup sg = new SmallGroup(user, bg);
				service.addSmGroup(sg);
				return true;
			} 
		} else {
			return false;
		}
	}
	// 그룹 삭제
	@ResponseBody
	@PostMapping("/deleteGroup")
	public void deleteGroup(String groupName) {
		BigGroup bg = service.searchBgCode(groupName);
		int bgCode = bg.getBgGroupCode();
		
		List<BigSchedule> bs = service.searchBsCode(bgCode);
		for(int i=0; i<bs.size(); i++) {
			int bsCode = bs.get(i).getBsCode();
			List<SmallSchedule> smallSchedule = service.selectOneSc(bsCode);
			for(int j=0; j<smallSchedule.size(); j++) {
				service.deleteGroup1(smallSchedule.get(j).getSsCode());
			}
			service.deleteGroup2(bsCode);
			service.deleteAllImg(bsCode);
		}
		service.deleteGroup3(bgCode);
		service.deleteGroup4(bgCode);
		service.deleteGroup5(bgCode);
	}
	
	// 전체 일정 추가
	@ResponseBody
	@PostMapping("/scheduleAdd")
	public boolean schduleAdd(HttpServletRequest request, BigSchedule bigSchedule, Model model) throws ParseException, UnsupportedEncodingException {
		String name = URLDecoder.decode(request.getHeader("referer"), "UTF-8");
		String groupName = name.substring(22); // url 링크에서 그룹명 잘라내어 디코딩 이후 사용
		BigGroup bg = service.searchBgCode(groupName);
		int num = bg.getBgGroupCode();
		List<BigSchedule> bs = service.searchBsCode(num);
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		bigSchedule.setBigGroup(bg);
		bigSchedule.setUser(user);
		
		// 컬러 추가
		int rand1 = (int)(Math.random()*256);
		int rand2 = (int)(Math.random()*256);
		int rand3 = (int)(Math.random()*256);
		
		String color = "rgba(" + rand1 + "," + rand2 + "," + rand3 + ", 0.5)";
		bigSchedule.setScheduleColor(color);
		
		
		// 날짜에 따른 중복 제거 로직
		String addStartDate = bigSchedule.getStartDate();
		String addEndDate = bigSchedule.getEndDate();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		Date adStartDate = new Date(dateFormat.parse(addStartDate).getTime());
		Date adEndDate = new Date(dateFormat.parse(addEndDate).getTime());
		
		int count = 0;
		
		for(int i = 0; i<bs.size(); i++) {
			String originalStartDate = bs.get(i).getStartDate();
			String originalEndDate = bs.get(i).getEndDate();
			
			Date ogStartDate = new Date(dateFormat.parse(originalStartDate).getTime());
			Date ogEndDate = new Date(dateFormat.parse(originalEndDate).getTime());
		
			int compareStart1 = adStartDate.compareTo(ogStartDate);
			int compareStart2 = adEndDate.compareTo(ogStartDate);
			
			int compareEnd1 = adStartDate.compareTo(ogEndDate);
			int compareEnd2 = adEndDate.compareTo(ogEndDate);
			
			if((compareStart1 < 0) && (compareStart2 < 0)) {
				
			} else if((compareEnd1 > 0) && (compareEnd2 > 0)) {
				
			} else if((compareStart1 == 0) || (compareStart2 == 0)) {
				count++;
			} else if((compareEnd1 ==0 ) || (compareEnd2 == 0)) {
				count++;
			} else {
				count++;
			}
		}
		if(count >= 1) {
			return false;
		} else {
			service.scheduleAdd(bigSchedule); // 위의 로직을 거치고 전체 일정 생성
			return true;
		}
	}
	// 하나의 전체 일정에 따른 세부 일정 만들기
	@ResponseBody
	@PostMapping("/scheduleAdd2")
	public SmallSchedule scheduleAdd2(HttpServletRequest request, SmallSchedule smallSchedule, int bsCode, String curDate)  {
		String url;
		try {
			url = crawling.getImgUrl(smallSchedule.getServiceName());
			smallSchedule.setServiceImg(url);
		} catch (InterruptedException | NoSuchElementException e) {
			System.out.println("등록 실패");
		}
		smallSchedule.setBigSchedule(service.selectOneBs(bsCode));	
		smallSchedule.setCurDate(curDate);
		service.scheduleAdd2(smallSchedule);
		return smallSchedule;
	}
	//세부 일정에 따른 지불 품목 생성
	@ResponseBody
	@PostMapping("/insertMoney")
	public void insertMoney(Money money, int ssCode) {
		SmallSchedule sm = new SmallSchedule();
		sm.setSsCode(ssCode);
		money.setSmallSchedule(sm);
		service.insertMoney(money);
	}
}

package com.semi.forever404.controller;

import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.forever404.model.dto.CalendarDTO;
import com.semi.forever404.model.dto.MoneyDTO;
import com.semi.forever404.model.vo.BigGroup;
import com.semi.forever404.model.vo.BigSchedule;
import com.semi.forever404.model.vo.Photo;
import com.semi.forever404.model.vo.SmallGroup;
import com.semi.forever404.model.vo.SmallSchedule;
import com.semi.forever404.model.vo.Tip;
import com.semi.forever404.model.vo.User;
import com.semi.forever404.service.GroupService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {
	@Autowired
	private GroupService service;

	// index 페이지 이동 및 user 세션 존재 시, movement-main으로 이동하게끔.
	@GetMapping("/")
	public String index(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null) return "movement";
		else return "index";
	}
	
	//회원가입 창 이동
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	//개발자 정보 페이지
	@GetMapping("/developer")
	public String developer() {
		return "developer";
	}
	
	// main으로 이동 전 애니메이션 페이지
	@GetMapping("/movement")
	public String movement() {
		return "movement";
	}
	
	// 켈린더 페이지
	@GetMapping("/main")
	public String main(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null) {
		List<SmallGroup> list = service.selectSmallGroup(user.getId());
		// 한 그룹의 여러 회원	
		session.setAttribute("smlist", list);
		
		if(list.isEmpty()) {
			session.setAttribute("check", false);
		} else {
			session.setAttribute("check", true);
		}
		}
		return "main";
	}
	// 세부 일정 생성 페이지 이동 및 로딩창에 나오는 문구 db에서 가져오기
	@GetMapping("/kakao/map")
	public String kakaomap(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int random = (int)(Math.random()*44);
		List<Tip> list = service.tip();

		session.setAttribute("tip", list.get(random).getTip());

		return "kakaomap2";
	}
	
	@GetMapping("/{groupName}")
	public String select(@PathVariable("groupName") String groupName, BigSchedule bigSchedule, HttpServletRequest request, Model model) {
		
		if(!groupName.equals("favicon.ico")) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			
			BigGroup bg = service.searchBgCode(groupName);
			List<SmallGroup> userList = service.selectSmallGroup2(bg.getBgGroupCode());
			session.setAttribute("userList", userList);
			request.setAttribute("userListSize", userList.size());
			bigSchedule.setBigGroup(bg);
			List<BigSchedule> bsList = service.selectBg(bigSchedule);
			model.addAttribute("bsList", bsList);
			
			if(user!=null) return "main";
			else return "redirect:/";
		}
		return null;
	}
	
	@GetMapping("/{groupName}/detail")
	public String detail(@PathVariable String groupName, @RequestParam int bsCode, HttpServletRequest request, Model model) {
	
		HttpSession session = request.getSession();

		List<CalendarDTO> list = new ArrayList<CalendarDTO>(); // 최종 리스트
		List<SmallSchedule> smallSchedule = service.selectOneSc(bsCode);
		
		BigSchedule tmp = service.selectOneBs(bsCode);
		
		String startDate = tmp.getStartDate();
		String endDate = tmp.getEndDate();
		
		LocalDate startDate2 = LocalDate.parse(startDate);
		LocalDate endDate2 = LocalDate.parse(endDate);
		
		List<LocalDate> dateRange = getDateRange(startDate2, endDate2);
		List<String> stringDates = dateRange.stream().map(LocalDate::toString).collect(Collectors.toList());
		
		for(int i=0; i<dateRange.size(); i++) {
			List<MoneyDTO> addList = new ArrayList<>();
			for(SmallSchedule ss : smallSchedule) {
				if(ss.getCurDate().equals(stringDates.get(i))) {
					addList.add(new MoneyDTO(ss, service.selectMoney(ss.getSsCode())));
				}
			}
			list.add(new CalendarDTO(stringDates.get(i), addList));
		}
		
		session.setAttribute("totalList", list);

		
		if(session.getAttribute("user")!=null) return "detail2";
		else return "redirect:/";
	}
	
	public List<LocalDate> getDateRange(LocalDate startDate, LocalDate endDate) {
		List<LocalDate> dates = new ArrayList<>();
		LocalDate currentDate = startDate;

		// 날짜 목록에 포함할 날짜가 끝 날짜보다 이전이거나 같을 때까지 반복
		while (!currentDate.isAfter(endDate)) {
			dates.add(currentDate);
			currentDate = currentDate.plusDays(1); // 하루씩 더하기
		}

		return dates;
	}
	@PostMapping("/mola")
    @ResponseBody
    public Map<String, Object> processGroupName(@RequestBody Map<String, String> requestData) {
        String groupName = requestData.get("groupName");
    
        // 응답 데이터 준비
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("groupName", groupName);
        return response;
    }
	
	@ResponseBody
	@PostMapping("/selectMyImg")
	public List<Photo> photoList(HttpServletRequest request, int bsCode) {
		List<Photo> photoList = service.selectMyImg(bsCode);
		HttpSession session = request.getSession();
		
		session.setAttribute("photoL", photoList);
		return photoList;
	}
	
	
	@ResponseBody
	@PostMapping("/deletePhoto")
	public void deletePhoto(String photoUrl, int photoCode) {
		String url = photoUrl.replace("http://192.168.10.28:8080/storage/","\\\\192.168.10.28\\forever404\\storage\\");
		if(photoUrl!=null) {
			File file = new File (url);
			file.delete();
		}
		
		service.deleteImg(photoCode);
		
	}
	
	// 세부스케줄 삭제
	@ResponseBody
	@GetMapping("/deleteSc")
	public void deleteSc(int ssCode) {
		service.deleteGroup1(ssCode);
		service.deleteSc(ssCode);
	}
	
	// 금액 삭제
	@ResponseBody
	@GetMapping("/deleteM")
	public void deleteM(int mCode) {
		service.deleteM(mCode);
	}
	
	// 전체일정 삭제
	@ResponseBody
	@GetMapping("/deleteBs")
	public void deleteBs(int bsCode) {
		List<SmallSchedule> smallSchedule = service.selectOneSc(bsCode);
		for(int i=0; i<smallSchedule.size(); i++) {
			// 스몰스케쥴 ss_code로 money테이블 조회해서 삭제하고
			service.deleteGroup1(smallSchedule.get(i).getSsCode()); // money 테이블
		}
		service.deleteGroup2(bsCode);
		service.deleteAllImg(bsCode);
		service.deleteBs(bsCode);
	}
	
}

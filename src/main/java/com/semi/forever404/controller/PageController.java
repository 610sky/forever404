package com.semi.forever404.controller;

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

import com.semi.forever404.model.vo.BigGroup;
import com.semi.forever404.model.vo.BigSchedule;
import com.semi.forever404.model.vo.Money;
import com.semi.forever404.model.vo.SmallGroup;
import com.semi.forever404.model.vo.SmallSchedule;
import com.semi.forever404.model.vo.User;
import com.semi.forever404.service.GroupService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {
	@Autowired
	private GroupService service;

	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	@GetMapping("/developer")
	public String developer() {
		return "developer";
	}
	@GetMapping("/movement")
	public String movement() {
		return "movement";
	}
	
	@GetMapping("/main")
	public String main(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null) {
		List<SmallGroup> list = service.selectSmallGroup(user.getId());
		session.setAttribute("smlist", list);
		System.out.println(list);
		
		if(list.isEmpty()) {
			session.setAttribute("check", false);
		} else {
			session.setAttribute("check", true);
		}
		}
		return "main";
	}
	
	@GetMapping("/kakao/map")
	public String kakaomap(HttpServletRequest request) {	
//		HttpSession session = request.getSession();
//		List<SmallSchedule> smallSchedule = (List<SmallSchedule>) session.getAttribute("selectS");
		
		return "kakaomap2";
	}
	
	@GetMapping("/{groupName}")
	public String select(@PathVariable("groupName") String groupName, BigSchedule bigSchedule, HttpServletRequest request, Model model) {
		
		if(!groupName.equals("favicon.ico")) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			
			BigGroup bg = service.searchBgCode(groupName);
			bigSchedule.setBigGroup(bg);
			List<BigSchedule> bsList = service.selectBg(bigSchedule);
			model.addAttribute("bsList", bsList);
			//System.out.println("86 : " + groupName);
			
			if(user!=null) return "main";
			else if(user==null) return "redirect:/";
			else return null;
		}
		return null;
	}
	
	@GetMapping("/{groupName}/detail")
	public String detail(@PathVariable String groupName, @RequestParam int bsCode, HttpServletRequest request, Model model) {
		
	
		HttpSession session = request.getSession();
		
//		BigSchedule bg = (BigSchedule) session.getAttribute("selectB");
		
		List<SmallSchedule> smallSchedule = service.selectOneSc(bsCode);
		BigSchedule tmp = service.selectOneBs(bsCode);
		
		String startDate = tmp.getStartDate();
		String endDate = tmp.getEndDate();
		
		LocalDate startDate2 = LocalDate.parse(startDate);
		LocalDate endDate2 = LocalDate.parse(endDate);

		List<LocalDate> dateRange = getDateRange(startDate2, endDate2);
		
		if(!smallSchedule.isEmpty()) {
			List<Money> MoneyList = service.selectMoney(2);
			session.setAttribute("moneyL", MoneyList);
		}
		session.setAttribute("selectSRange", dateRange);
		model.addAttribute("selectSRange", dateRange.stream().map(LocalDate::toString).collect(Collectors.toList()));
		System.out.println(dateRange);
		session.setAttribute("selectS", smallSchedule);
		if(session.getAttribute("user")!=null) return "detail2";
		else return "redirect:/";
	}
	/*
	@ResponseBody
	@PostMapping("/{groupName}/detail/selectList")
	public  Map<String, Object> selectData (@RequestBody Map<String, Object> paramMap){
		
		Map<String, Object> result = new HashMap<>();
		

		  Object bsCode = paramMap.get("bsCode");

	        // 일정의 시작일과 종료일을 가져오기 위한 코드 (가정)
	        Map<String, Object> dateRange =  service.getDateRange((int) bsCode); // bsCode를 이용해 시작일과 종료일을 가져옴
	        String stdDate = (String) dateRange.get("stdDate");
	        String endDate = (String) dateRange.get("endDate");

	        // paramMap에 stdDate와 endDate 추가
	        paramMap.put("stdDate", stdDate);
	        paramMap.put("endDate", endDate);
		
		
	        List<Map<String, Object>> list = service.getDateList(stdDate, endDate);
		Map<String, Object> detail = null; //service.detailselect(paramMap); //파라미터로 bsCode, groupName들어감
		
		result.put("result", true); 
		result.put("list", list);

		return result;
		
	}
	*/
	
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
        // 데이터 처리 로직
        System.out.println("Group Name: " + groupName);
        // 응답 데이터 준비
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("groupName", groupName);
        return response;
    }
}

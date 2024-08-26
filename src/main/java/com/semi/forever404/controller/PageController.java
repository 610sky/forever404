package com.semi.forever404.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.semi.forever404.model.vo.BigGroup;
import com.semi.forever404.model.vo.BigSchedule;
import com.semi.forever404.model.vo.Money;
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
	public String main() {
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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		BigGroup bg = service.searchBgCode(groupName);
		bigSchedule.setBigGroup(bg);
		List<BigSchedule> bsList = service.selectBg(bigSchedule);
		model.addAttribute("bsList", bsList);
		session.setAttribute("groupName", groupName);
		return "main";
	}
	
	@GetMapping("/{groupName}/detail")
	public String detail(@PathVariable("groupName") String groupName, int bsCode, HttpServletRequest request) {
//		System.out.println("groupName : " + groupName);
//		System.out.println("bsCode : " + bsCode);
		HttpSession session = request.getSession();
//		BigSchedule bg = (BigSchedule) session.getAttribute("selectB");
//		System.out.println(bg);
		
		List<SmallSchedule> smallSchedule = service.selectOneSc(bsCode);
		BigSchedule tmp = service.selectOneBs(bsCode);
		
		String startDate = tmp.getStartDate();
		String endDate = tmp.getEndDate();
		
		LocalDate startDate2 = LocalDate.parse(startDate);
        LocalDate endDate2 = LocalDate.parse(endDate);
        
        List<LocalDate> dateRange = getDateRange(startDate2,endDate2);
		
		if(!smallSchedule.isEmpty()) {
		
        
        List<Money> MoneyList = service.selectMoney(2);
        
		
		session.setAttribute("moneyL", MoneyList);
		
		}
		session.setAttribute("selectSRange", dateRange);
		System.out.println(dateRange);
		session.setAttribute("selectS", smallSchedule);
		return "detail2";
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
}

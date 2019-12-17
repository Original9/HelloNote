package co.yedam.hellonote.dday.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DDayController {
	
	@RequestMapping(value="dDay")
	public String getDDayList() {
		
		return "main/menuList/dDay";		
	}
	

}

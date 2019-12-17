package co.yedam.hellonote.calendar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.hellonote.calendar.service.CalendarService;
import co.yedam.hellonote.calendar.vo.CalendarVO;


@Controller
public class CalendarController {
	
	@Autowired CalendarService calendarService;
	
@RequestMapping(value="/calendar")
public String getCalendarList(HttpSession session,HttpServletRequest request, Model model, CalendarVO vo) {
	// 클릭했을 떄 session 값으로 메뉴 아이디를 넣어놔야겟다.
	String menuId = request.getParameter("menuId");
	session.setAttribute("menuId", menuId);
	
	return "main/menuList/calendar";
}

}

package co.yedam.hellonote.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.hellonote.calendar.service.CalendarService;
import co.yedam.hellonote.calendar.vo.CalendarVO;
import co.yedam.hellonote.user.vo.UserVO;

@RestController
public class RestfulCalendarController {
	
	@Autowired CalendarService calendarService;
	
@RequestMapping(value="/getCalendarList", method=RequestMethod.GET)
public List<CalendarVO> getCalendarList(HttpServletRequest request,Model model, CalendarVO vo) {
	//여기서 세션값을 확인하자, 세션값을 받아서 넘기자 calendarList(user vo 여기 넘어서 넘기자)
	// 세션값을 미리 User controller 에서 등록 해놓았기 때문에 여기서 그냥 불러오면되는지 확인하자. 
	HttpSession session = request.getSession(); // 세션값을 받아온다.	
	vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
	vo.setMenuId((String)session.getAttribute("menuId"));	
	
	return calendarService.getCalendarList(vo);
}

@RequestMapping(value="/addCalendar")
public int addCalendar(HttpServletRequest request, CalendarVO vo) { // Requestbody 안해줘도 자동으로 들어간다.;
	//HttpSession session = request.getSession(); // 세션값을 받아온다.
	HttpSession session = request.getSession();
	vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
	vo.setMenuId((String)session.getAttribute("menuId"));
	// 세션에다가 menuID값을 넣어서 같이 넣어줘야 한다. 
	
	return calendarService.insertCalendar(vo);
}

@RequestMapping(value="/dgagAnddropReviseCalendar")
public int revise(HttpServletRequest request, CalendarVO vo) {
	
	HttpSession session = request.getSession();
	vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
	vo.setMenuId((String)session.getAttribute("menuId"));
	return calendarService.dragAnddropReviseCalendar(vo);
	
	
}

@RequestMapping(value="/deleteCalendar")
public int deleteCalendar(HttpServletRequest request, CalendarVO vo) {
	HttpSession session = request.getSession();
	vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
	vo.setMenuId((String)session.getAttribute("menuId"));
	return calendarService.deleteCalendar(vo);
}

@RequestMapping(value="/updateCalendar")
public int updateCalendar(HttpServletRequest request, CalendarVO vo) {
	HttpSession session = request.getSession();
	vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
	vo.setMenuId((String)session.getAttribute("menuId"));
	return calendarService.updateCalendar(vo);
}

@RequestMapping(value="/getCalendarSeq")
public int getCalendarSeq(HttpServletRequest request, CalendarVO vo) {
	HttpSession session = request.getSession();
	vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
	vo.setMenuId((String)session.getAttribute("menuId"));
	System.out.println(calendarService.getCalendarSeq(vo)+"return");
	return calendarService.getCalendarSeq(vo);
}

}

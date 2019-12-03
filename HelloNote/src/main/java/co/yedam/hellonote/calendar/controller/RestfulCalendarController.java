package co.yedam.hellonote.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.hellonote.calendar.service.CalendarService;
import co.yedam.hellonote.calendar.vo.CalendarVO;

@RestController
public class RestfulCalendarController {
	
	@Autowired CalendarService calendarService;
	
@RequestMapping(value="/getCalendarList", method=RequestMethod.GET)
public List<CalendarVO> getCalendarList(Model model, CalendarVO vo) {
	
	return calendarService.getCalendarList(vo);
}


}

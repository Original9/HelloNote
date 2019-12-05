package co.yedam.hellonote.calendar.service;

import java.util.List;

import co.yedam.hellonote.calendar.vo.CalendarVO;
import co.yedam.hellonote.user.vo.UserVO;

public interface CalendarService {
	//전체조회
	List<CalendarVO> getCalendarList(CalendarVO vo, UserVO user);
	//삭제
	int deleteCalendar(CalendarVO vo);
	//등록
	int insertCalendar(CalendarVO vo,UserVO user);
	//수정
	int updateCalendar(CalendarVO vo);
	
}
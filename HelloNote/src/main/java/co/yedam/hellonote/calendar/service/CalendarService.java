package co.yedam.hellonote.calendar.service;

import java.util.List;

import co.yedam.hellonote.calendar.vo.CalendarVO;

public interface CalendarService {
	//전체조회
	List<CalendarVO> getCalendarList(CalendarVO vo);
	//삭제
	int deleteCalendar(CalendarVO vo);
	//등록
	int insertCalendar(CalendarVO vo);
	//수정
	int updateCalendar(CalendarVO vo);
	
}

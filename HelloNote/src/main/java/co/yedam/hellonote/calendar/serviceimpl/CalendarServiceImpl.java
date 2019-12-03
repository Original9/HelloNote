package co.yedam.hellonote.calendar.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.calendar.dao.CalendarDAO;
import co.yedam.hellonote.calendar.service.CalendarService;
import co.yedam.hellonote.calendar.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	CalendarDAO dao;
	
	@Override
	public List<CalendarVO> getCalendarList(CalendarVO vo) {
		// TODO Auto-generated method stub
		return dao.getCalendarList();
	}

	@Override
	public int deleteCalendar(CalendarVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteCalendar(vo);
	}

	@Override
	public int insertCalendar(CalendarVO vo) {
		// TODO Auto-generated method stub
		return dao.insertCalendar(vo);
	}

	@Override
	public int updateCalendar(CalendarVO vo) {
		// TODO Auto-generated method stub
		return dao.updateCalendar(vo);
	}

}

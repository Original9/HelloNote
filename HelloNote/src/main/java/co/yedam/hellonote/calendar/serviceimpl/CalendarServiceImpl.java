package co.yedam.hellonote.calendar.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.calendar.dao.CalendarDAO;
import co.yedam.hellonote.calendar.service.CalendarService;
import co.yedam.hellonote.calendar.vo.CalendarVO;
import co.yedam.hellonote.user.vo.UserVO;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	CalendarDAO dao;
	
	@Override
	public List<CalendarVO> getCalendarList(CalendarVO vo,UserVO user) {
		
		UserVO user1 = new UserVO();
		user1.setHellonoteId(user.getHellonoteId());
		
		
		return dao.getCalendarList(vo, user1); // user1에 session id 값인 hellonoteId값을 넣어서 넘긴
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

	@Override
	public int dragAnddropReviseCalendar(CalendarVO vo) {
		// TODO Auto-generated method stub
		return dao.dragAnddropReviseCalendar(vo);
	}

}

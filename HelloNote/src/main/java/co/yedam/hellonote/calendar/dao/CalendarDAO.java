package co.yedam.hellonote.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.calendar.vo.CalendarVO;
import co.yedam.hellonote.user.vo.UserVO;

@Repository
public class CalendarDAO {
	
	@Autowired
	SqlSessionTemplate calendar;
	
	//전체 조회
	public List<CalendarVO> getCalendarList(CalendarVO vo, UserVO user){
		return calendar.selectList("CalendarDAO.getCalendarList",user);		
	}
	
	//삭제
	public int deleteCalendar(CalendarVO vo) {
		return calendar.delete("CalendarDAO.deleteCalendar",vo);
	}
	
	//등륵
	public int insertCalendar(CalendarVO vo, UserVO user) {
		return calendar.insert("CalendarDAO.insertCalendar", vo);		
	}	
	
	//수정
	public int updateCalendar(CalendarVO vo) {
		return calendar.update("CalendarDAO.updateCalendar",vo);
	}
	

}

package co.yedam.hellonote.dday.service;

import java.util.List;

import co.yedam.hellonote.dday.vo.DDayVO;

public interface DDayService {
	
	List<DDayVO> getDDayList(DDayVO vo);
	
	DDayVO getDDay(DDayVO vo);
	
	int insertDDay(DDayVO vo);
	
	int deleteDDay(DDayVO vo);
	

}

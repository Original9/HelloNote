package co.yedam.hellonote.dday.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.dday.dao.DDayDAO;
import co.yedam.hellonote.dday.service.DDayService;
import co.yedam.hellonote.dday.vo.DDayVO;

@Service
public class DDayServiceImpl implements DDayService{

	@Autowired
	DDayDAO dao;
	
	@Override
	public List<DDayVO> getDDayList(DDayVO vo) {
		// TODO Auto-generated method stub
		return dao.getDDayList(vo);
	}

	@Override
	public DDayVO getDDay(DDayVO vo) {
		// TODO Auto-generated method stub
		return dao.getDDay(vo);
	}

	@Override
	public int insertDDay(DDayVO vo) {
		// TODO Auto-generated method stub
		return dao.insertDDay(vo);
	}

	@Override
	public int deleteDDay(DDayVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteDDay(vo);
	}

}

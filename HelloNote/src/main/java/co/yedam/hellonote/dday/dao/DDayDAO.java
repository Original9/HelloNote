package co.yedam.hellonote.dday.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.dday.vo.DDayVO;

@Repository
public class DDayDAO {


	@Autowired
	SqlSessionTemplate dday;
	
	
	public List<DDayVO> getDDayList(DDayVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	public DDayVO getDDay(DDayVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertDDay(DDayVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteDDay(DDayVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
}

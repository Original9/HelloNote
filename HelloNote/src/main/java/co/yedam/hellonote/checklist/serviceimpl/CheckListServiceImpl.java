package co.yedam.hellonote.checklist.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.checklist.dao.CheckListDAO;
import co.yedam.hellonote.checklist.service.CheckListService;
import co.yedam.hellonote.checklist.vo.CheckListVO;

@Service
public class CheckListServiceImpl implements CheckListService{

	@Autowired
	CheckListDAO dao;
	
	@Override
	public List<CheckListVO> getCheckList(CheckListVO vo) {
		return dao.getCheckList(vo);
	}
	@Override
	public List<CheckListVO> getCheckListT5(CheckListVO vo)
	{
		return dao.getCheckListT5(vo);
	}

	@Override
	public int deleteList(CheckListVO vo) {
		return dao.deleteList(vo);
	}

	@Override
	public int insertList(CheckListVO vo) {
		return dao.insertList(vo);
	}

	@Override
	public int updateList(CheckListVO vo) {
		return dao.updateList(vo);
	}

}

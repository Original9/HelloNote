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
		// TODO Auto-generated method stub
		return dao.getCheckList();
	}

	@Override
	public int deleteList(CheckListVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteList();
	}

	@Override
	public int insertList(CheckListVO vo) {
		// TODO Auto-generated method stub
		return dao.insertList();
	}

	@Override
	public int updateList(CheckListVO vo) {
		// TODO Auto-generated method stub
		return dao.updateList();
	}

}

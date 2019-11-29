package co.yedam.hellonote.mysitelist.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.mysitelist.dao.MySiteListDAO;
import co.yedam.hellonote.mysitelist.service.MySiteListService;
import co.yedam.hellonote.mysitelist.vo.MySiteListVO;

@Service
public class MySiteListServiceImpl implements MySiteListService{

	@Autowired
	MySiteListDAO dao;
	
	@Override
	public List<MySiteListVO> getMySiteList() {
		return dao.getMySiteList();
	}

	@Override
	public int deleteMySiteList(MySiteListVO vo) {
		return dao.deleteMySiteList(vo);
	}

	// 암호화
	@Override
	public int insertMySiteList(MySiteListVO vo) {
		return dao.insertMySiteList(vo);
	}
	
	// 암호화
	@Override
	public int updateMySiteList(MySiteListVO vo) {
		return dao.updateMySiteList(vo);
	}

	@Override
	public MySiteListVO getMySiteList(MySiteListVO vo) {
		return dao.getMySiteList(vo);
	}
}

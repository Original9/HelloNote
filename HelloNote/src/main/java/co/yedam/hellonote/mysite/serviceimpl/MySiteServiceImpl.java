package co.yedam.hellonote.mysite.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.mysite.dao.MySiteDAO;
import co.yedam.hellonote.mysite.service.MySiteService;
import co.yedam.hellonote.mysite.vo.MySiteVO;

@Service
public class MySiteServiceImpl implements MySiteService{

	@Autowired
	MySiteDAO dao;
	
	@Override
	public List<MySiteVO> getMySiteList(MySiteVO vo) {
		return dao.getMySiteList();
	}

	@Override
	public int deleteMySite(MySiteVO vo) {
		return dao.deleteMySite(vo);
	}

	// 암호화
	@Override
	public int insertMySite(MySiteVO vo) {
		return dao.insertMySite(vo);
	}
	
	// 암호화
	@Override
	public int updateMySite(MySiteVO vo) {
		return dao.updateMySite(vo);
	}

	@Override
	public MySiteVO getMySite(MySiteVO vo) {
		return dao.getMySite(vo);
	}
}

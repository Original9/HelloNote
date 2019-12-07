package co.yedam.hellonote.menu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.menu.dao.MenuDAO;
import co.yedam.hellonote.menu.service.MenuService;
import co.yedam.hellonote.menu.vo.MenuVO;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuDAO dao;
	
	@Override
	public List<MenuVO> menuList(MenuVO vo) {
		return dao.menuList(vo);
	}
	
	
}

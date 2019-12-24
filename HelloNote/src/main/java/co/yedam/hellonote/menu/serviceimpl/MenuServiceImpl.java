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
	
	@Override
	public void sortHandling1(MenuVO vo) {
		dao.sortHandling1(vo);
	}
	
	@Override
	public void sortHandling2(MenuVO vo) {
		dao.sortHandling2(vo);
	}

	@Override
	public int insertMenu(MenuVO vo) {
		return dao.insertMenu(vo);
	}

	@Override
	public void deleteMenu(MenuVO vo) {
		int menuType = dao.selectMenuType(vo);
		switch (menuType) {
		case 1:
			vo.setMenuTableName("calendar");
			break;
		case 2:
			vo.setMenuTableName("memo");
			break;
		case 3:
			vo.setMenuTableName("d_day");
			break;
		case 4:
			vo.setMenuTableName("accountbook");
			break;
		case 5:
			vo.setMenuTableName("bankaccount");
			break;
		case 6:
			vo.setMenuTableName("check");
			break;
		case 7:
			vo.setMenuTableName("marketlist");
			break;
		case 8:
			vo.setMenuTableName("mysite");
			break;
		}
		dao.menuDeleteHandling(vo);
		dao.menuDeleteHandling1(vo);
		dao.menuDeleteHandling2(vo);
		dao.deleteMenu(vo);
	}

	@Override
	public void editMenu(MenuVO vo) {
		dao.editMenu(vo);
	}
}

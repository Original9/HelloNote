package co.yedam.hellonote.menu.service;

import java.util.List;

import co.yedam.hellonote.menu.vo.MenuVO;

public interface MenuService {

	public List<MenuVO> menuList(MenuVO vo);
	public void sortHandling1(MenuVO vo);
	public void sortHandling2(MenuVO vo);
	public int insertMenu(MenuVO vo);
	public void deleteMenu(MenuVO vo);
	public void editMenu(MenuVO vo);
}

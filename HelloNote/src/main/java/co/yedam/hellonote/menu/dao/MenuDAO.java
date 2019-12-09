package co.yedam.hellonote.menu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.menu.vo.MenuVO;

@Repository
public class MenuDAO {

	@Autowired
	private SqlSessionTemplate batis;

	public List<MenuVO> menuList(MenuVO vo) {
		return batis.selectList("MenuDAO.menuList", vo);
	}

	public void sortHandling1(MenuVO vo) {
		batis.update("MenuDAO.sortHandling1", vo);
	}

	public void sortHandling2(MenuVO vo) {
		batis.update("MenuDAO.sortHandling2", vo);
	}
}

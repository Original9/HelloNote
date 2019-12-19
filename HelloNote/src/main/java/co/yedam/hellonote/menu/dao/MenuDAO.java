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
	
	public int insertMenu(MenuVO vo) {
		return batis.insert("MenuDAO.insertMenu", vo);
	}
	
	public void deleteMenu(MenuVO vo ) {
		batis.delete("MenuDAO.deleteMenu", vo);
	}
	
	public void editMenu(MenuVO vo) {
		batis.update("MenuDAO.editMenu", vo);
	}
	
	public int selectMenuType(MenuVO vo) {
		return batis.selectOne("MenuDAO.menuType", vo);
	}
	
	// 삭제된 메뉴의 콘텐츠들 삭제
	public void menuDeleteHandling(MenuVO vo) {
		batis.delete("MenuDAO.menuDeleteHandling", vo);
	}
	
	// 메뉴 삭제 후 순서 정리
	public void menuDeleteHandling1(MenuVO vo) {
		batis.update("MenuDAO.menuDeleteHandling1", vo);
	}
	
	// 메뉴 삭제 전 위젯 삭제
	public void menuDeleteHandling2(MenuVO vo) {
		batis.delete("MenuDAO.menuDeleteHandling2", vo);
	}
	
}

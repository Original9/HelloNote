package co.yedam.hellonote.menu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.hellonote.menu.service.MenuService;
import co.yedam.hellonote.menu.vo.MenuVO;

@RestController
public class MenuController {

	@Autowired
	private MenuService service;

	@RequestMapping("menuList")
	public List<MenuVO> menuList(HttpSession session, MenuVO vo) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());

		return service.menuList(vo);
	}

	@RequestMapping("menuSortHandling")
	public void sortHandling(MenuVO vo, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		service.sortHandling1(vo);
		service.sortHandling2(vo);
	}

	@RequestMapping("insertMenu")
	public int menuInsert(MenuVO vo, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		service.insertMenu(vo);

		return vo.getMenuId();
	}

	@RequestMapping("deleteMenu")
	public void deleteMenu(MenuVO vo, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		service.deleteMenu(vo);
	}

	@RequestMapping("editMenu")
	public void editMenu(MenuVO vo, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		service.editMenu(vo);
	}
}

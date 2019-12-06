package co.yedam.hellonote.menu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
		vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
		
		return service.menuList(vo);
	}
	
}

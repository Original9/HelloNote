package co.yedam.hellonote.checklist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CheckListController {
	@RequestMapping(value="/checkList")
	public String getCheckList(HttpServletRequest request, HttpSession session) {
		
		String menuId = request.getParameter("menuId");
		session.setAttribute("menuId",menuId);
	
		return "main/menuList/checkList";
	}

}

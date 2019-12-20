package co.yedam.hellonote.checklist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.hellonote.checklist.service.CheckListService;
import co.yedam.hellonote.checklist.vo.CheckListVO;

@Controller
public class CheckListController {
	
	@Autowired
	CheckListService checkListService;
	
	
	@RequestMapping(value="/checkList")
	public String getCheckList(HttpServletRequest request) {
		
		String menuId = request.getParameter("menuId");
		request.setAttribute("menuId", menuId);
//		session.setAttribute("menuId",menuId);
	
		return "main/menuList/checkList";
	}
	
}

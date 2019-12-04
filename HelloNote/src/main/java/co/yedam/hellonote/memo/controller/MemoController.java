package co.yedam.hellonote.memo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.hellonote.memo.service.MemoService;
import co.yedam.hellonote.user.vo.UserVO;

@Controller
public class MemoController {

	@Autowired
	MemoService service;
	
	@RequestMapping("/memo")
	public String getBoardList(Model model, HttpSession session, UserVO vo) {
		String hellonotId = (String) session.getAttribute("hellonoteId");
		
		vo.setHellonoteId(hellonotId);
		
		model.addAttribute("memoList", service.getMemoList(vo));
		return "main/main/memo";
	}
	
}

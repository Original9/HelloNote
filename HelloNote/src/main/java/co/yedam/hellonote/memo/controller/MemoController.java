package co.yedam.hellonote.memo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.hellonote.memo.service.MemoService;

@Controller
public class MemoController {

	@Autowired
	MemoService service;
	
	@RequestMapping("/memo")
	public String getBoardList(Model model, HttpSession session) {
		String hellonotId = (String) session.getAttribute("hellonoteId");
		String pw = (String) session.getAttribute("pw");
		
		System.out.println(hellonotId);
		System.out.println(pw);
		model.addAttribute("memoList", service.getMemoList());
		return "main/main/memo";
	}
	
}

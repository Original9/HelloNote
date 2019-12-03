package co.yedam.hellonote.memo.controller;

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
	public String getBoardList(Model model) {
		model.addAttribute("memoList", service.getMemoList());
		return "main/main/memo";
	}
	
}

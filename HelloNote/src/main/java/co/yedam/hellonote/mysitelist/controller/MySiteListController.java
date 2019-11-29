package co.yedam.hellonote.mysitelist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.hellonote.mysitelist.service.MySiteListService;
import co.yedam.hellonote.mysitelist.vo.MySiteListVO;

@Controller
public class MySiteListController {

	@Autowired
	MySiteListService mySiteListService;

	// 목록조회
	@RequestMapping("getMySiteList")
	public String getMySiteList(Model model) {
		model.addAttribute("MySiteList", mySiteListService.getMySiteList());
		return "mySiteList/getMySiteList";
	}

	// 등록폼으로
	@RequestMapping("insertMySiteListForm")
	public String insertMySiteListForm() {
		return "mySiteList/insertMySiteList";
	}

	// 등록 처리
	@RequestMapping("insertMySiteListForm")
	public String insertMySiteListForm(MySiteListVO vo) {
		mySiteListService.insertMySiteList(vo);
		return "redirect:getMySiteList";
	}
}

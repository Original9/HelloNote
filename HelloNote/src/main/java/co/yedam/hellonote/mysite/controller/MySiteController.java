package co.yedam.hellonote.mysite.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.hellonote.mysite.service.MySiteService;
import co.yedam.hellonote.mysite.vo.MySiteVO;

@Controller
public class MySiteController {

	@Autowired
	MySiteService mySiteService;

	// 목록조회
	@RequestMapping("getMySiteList")
	public String getMySiteList(Model model, MySiteVO vo) {
		vo.setUserId("kwon");
		model.addAttribute("MySite", mySiteService.getMySiteList(vo));
		return "test/getMySite";
	}

	// 등록폼으로
	@RequestMapping("insertMySiteForm")
	public String insertMySiteForm() {
		return "test/insertMySite";
	}

	// 등록 처리
	@RequestMapping("insertMySite")
	public String insertMySiteForm(MySiteVO vo) {
		mySiteService.insertMySite(vo);
		return "redirect:getMySite";
	}
}

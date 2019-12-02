package co.yedam.hellonote.mysite.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value={"/mysite/*"} , method=RequestMethod.GET)
	public String showIssueList(HttpServletRequest request) {
		// url 값을 받아와서  * 에 넣어줘야 한다.
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path=uri.substring(context.length());
		String arrayOfUri[] = path.split("/");		
		String x = "main/"+arrayOfUri[1]+"/"+arrayOfUri[2];		
	return x;
	}
	
}

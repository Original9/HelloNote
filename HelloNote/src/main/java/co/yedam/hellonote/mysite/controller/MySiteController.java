package co.yedam.hellonote.mysite.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.yedam.hellonote.mysite.paging.Paging;
import co.yedam.hellonote.mysite.service.MySiteService;
import co.yedam.hellonote.mysite.vo.MySiteSearchVO;
import co.yedam.hellonote.mysite.vo.MySiteVO;

@Controller
public class MySiteController {

	// private static final Logger logger = LoggerFactory.getLogger(MySiteController.class);
	
	@Autowired
	MySiteService mySiteService;

	// 목록조회
	@RequestMapping("/mysite/getMySiteList")
	public String getMySiteList(Model model, MySiteSearchVO svo, Paging p) {
		svo.setUserId("kwon");
		// MySite key값
		model.addAttribute("mySite", mySiteService.getMySiteList(svo, p));
		model.addAttribute("paging", p);

		return "main/mysite/test";  // jsp 경로
	}

	// 등록 처리
	@RequestMapping("/mysite/insertMySite")
	public String insertMySiteForm(MySiteVO vo) {
		mySiteService.insertMySite(vo);
		return "redirect:mysite/getMySiteList";
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

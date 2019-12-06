package co.yedam.hellonote.mysite.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.hellonote.mysite.paging.Paging;
import co.yedam.hellonote.mysite.service.MySiteService;
import co.yedam.hellonote.mysite.vo.MySiteSearchVO;
import co.yedam.hellonote.mysite.vo.MySiteVO;

@Controller
public class MySiteController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(MySiteController.class);

	@Autowired
	MySiteService mySiteService;

	// 목록조회
	@RequestMapping("/mysite/getMySiteList")
	public String getMySiteList(Model model, MySiteSearchVO svo, Paging p) {
		svo.setUserId("kwon");
		// MySite key값
		model.addAttribute("mySite", mySiteService.getMySiteList(svo, p));
		model.addAttribute("paging", p);

		return "main/mysite/test"; // jsp 경로
	}

	// 등록 처리
	@RequestMapping("/mysite/insertMySite")
	public String insertMySite(MySiteVO vo) {
		vo.setUserId("kwon");
		vo.setMenuId("8");
		mySiteService.insertMySite(vo);
		return "redirect:getMySiteList";
	}

	// 삭제 처리
	@RequestMapping("/mysite/deleteMySite")
	public String deleteMySite(@RequestParam int[] rowCheck, MySiteVO vo) {
		vo.setUserId("kwon");
		mySiteService.deleteMySite(rowCheck, vo);
		return "redirect:getMySiteList";
	}

	@RequestMapping(value = { "/mysite/*" }, method = RequestMethod.GET)
	public String showIssueList(HttpServletRequest request) {
		// url 값을 받아와서 * 에 넣어줘야 한다.
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());
		String arrayOfUri[] = path.split("/");
		String x = "main/" + arrayOfUri[1] + "/" + arrayOfUri[2];
		return x;
	}

	// 단건 조회
	@ResponseBody
	@RequestMapping("/mysite/getMySite")
	public MySiteVO getMySite(MySiteVO vo) {
		vo.setUserId("kwon");
		return mySiteService.getMySite(vo);
	}
	
	// 단건 삭제
	@RequestMapping("/mysite/getMySitedelete")
	public String getMySitedelete(MySiteVO vo) {
		vo.setUserId("kwon");
		mySiteService.getMySitedelete(vo);
		return "redirect:getMySiteList";
	}
}

package co.yedam.hellonote.user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.hellonote.mysite.vo.MySiteVO;
import co.yedam.hellonote.user.service.UserService;
import co.yedam.hellonote.user.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	// 회원가입 등록처리 프로시저
	@RequestMapping("/user/insertUserSignUp")
	public String insertUserSignUp(UserVO vo) {
		userService.insertUserSignUp(vo);
		return "redirect:signup";
	}

	// 프로시저 단건삭제
	@RequestMapping("/user/deleteUserProc")
	public String deleteUserProc(UserVO vo) {
		userService.deleteUserProc(vo);
		return "redirect:getUserList";
	}
	
	// 프로시저 리스트 삭제 처리
	@RequestMapping("/user/deleteUserListProc")
	public String deleteUserListProc(@RequestParam String[] rowCheck, UserVO vo) {
		userService.deleteUserListProc(rowCheck, vo);
		return "redirect:getUserList";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {

		return "layout/login";
	}

	@RequestMapping(value = "user/signup", method = RequestMethod.GET)
	public String signup(Locale locale, Model model) {

		return "user/signup";
	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	public String loginCheck(HttpSession session, HttpServletRequest request, HttpServletResponse reponse, UserVO vo) {

		UserVO temp = new UserVO();
		temp = userService.getUser(vo);
		if (temp.getHellonoteId() == null) {
			// logger.info("Welcome home! The client locale is {}.", locale); // 로그찍거 !!
			return "layout/login";
		}

		session.setAttribute("hellonoteId", temp.getHellonoteId());
		session.setAttribute("pw", temp.getPw());

		return "redirect:mainPage";
	}

	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "main/main/mainPage";
	}

	// 관리자 페이지 이동
	@RequestMapping(value = { "/user/*" }, method = RequestMethod.GET)
	public String showIssueList(HttpServletRequest request) {
		// url 값을 받아와서 * 에 넣어줘야 한다.
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());
		String arrayOfUri[] = path.split("/");
		String x = "main/" + arrayOfUri[1] + "/" + arrayOfUri[2];
		return x;
	}

	// 유저 리스트 페이지
	@RequestMapping("/user/getUserList")
	public String getUserList(Model model, UserVO vo) {
		model.addAttribute("user", userService.getUserList(vo));
		return "main/user/userlist"; // jsp 경로
	}

	// 삭제 처리
	@RequestMapping("/user/deleteUser")
	public String deleteUser(@RequestParam String[] rowCheck, UserVO vo) {
		userService.deleteUser(rowCheck, vo);
		return "redirect:getUserList";
	}

	// 엑셀출력
	@RequestMapping("/user/downloadExcel2")
	public ModelAndView excelView(UserVO vo) throws IOException {
		List<Map<String, Object>> list = userService.getUserListMap(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] header = { "hellonoteId", "pw", "gender", "hGrant", "age", "hProfile" };
		map.put("headers", header);
		map.put("filename", "excel_userlist");
		map.put("datas", list);
		return new ModelAndView("commonExcelView", map);
	}

	// 단건 조회
	@ResponseBody
	@RequestMapping("/user/getUser")
	public UserVO getUser(UserVO vo) {
		return userService.getUser(vo);
	}

	// 단건 삭제
	@RequestMapping("/user/getUserdelete")
	public String getUserdelete(UserVO vo) {
		userService.getUserdelete(vo);
		return "redirect:getUserList";
	}

	// 수정
	@RequestMapping(value = "/user/updateUser", method = RequestMethod.PUT, consumes = "application/json" // 요청헤더
	)
	@ResponseBody // return 값이 java객체를 json 구조로 바꿔준다 @RequestBody는 반대로
	public UserVO updateUser(@RequestBody UserVO vo) {
		userService.updateUser(vo);
		return userService.getUser(vo);
	}
}

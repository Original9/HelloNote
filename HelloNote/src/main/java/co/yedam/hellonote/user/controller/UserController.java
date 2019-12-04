package co.yedam.hellonote.user.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.yedam.hellonote.user.service.UserService;
import co.yedam.hellonote.user.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		return "layout/login";
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	public String loginCheck(HttpServletRequest request, HttpServletResponse reponse, UserVO vo) {
		
		UserVO temp = new UserVO();
		temp = userService.getUser(vo);		
		if(temp.getHellonoteId() == null)
		{
			//logger.info("Welcome home! The client locale is {}.", locale); // 로그찍거 !!
			return "layout/login";
		}
		request.setAttribute("hellonoteId", temp.getHellonoteId());
		request.setAttribute("pw",temp.getPw());
		
		return "main/main/mainPage";
	}
	
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "main/main/mainPage";
	}

}

package co.yedam.hellonote;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale); // 로그찍거 !! 		
		
		return "main/main/mainPage";
	}
	
	/*@RequestMapping(value={"/menuList/*"} , method=RequestMethod.GET)
	public String showIssueList(HttpServletRequest request) {
		// url 값을 받아와서  * 에 넣어줘야 한다.
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path=uri.substring(context.length());
		String arrayOfUri[] = path.split("/");		
		String x = "main/"+arrayOfUri[1]+"/"+arrayOfUri[2];		
	return x;
	}*/
	


	
}

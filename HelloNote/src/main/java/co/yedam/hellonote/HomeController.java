package co.yedam.hellonote;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
		
		return "main";
	}
	
	@RequestMapping(value={"/menuList/*"} , method=RequestMethod.GET)
	public String showIssueList(HttpServletRequest request) {
		// url 값을 받아와서  * 에 넣어줘야 한다.
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path=uri.substring(context.length());
		System.out.println("URi:" + uri);
		System.out.println("cs:" + context);
		System.out.println("path:" + path);
		String t[] = path.split("/");
		for(int x = 0;x< t.length; x++)
		{
			System.out.println(t[x]);
		}
		String x = "main/"+t[1]+"/"+t[2];		
	return x;
	}
	


	
}

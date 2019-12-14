package co.yedam.hellonote.user.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Login Check login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		String login = (String) request.getSession().getAttribute("login");
		
		if(login == null) {
			// login == null 시 login page로 리다이렉트
			response.sendRedirect("/mainPage");
			return false;
		}
		return true;
	}
}

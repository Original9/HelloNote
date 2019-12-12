package co.yedam.hellonote.widget.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.hellonote.widget.service.WidgetService;
import co.yedam.hellonote.widget.vo.WidgetVO;

@RestController
public class WidgetController {

	@Autowired
	WidgetService service;

	@RequestMapping("getWidgetList")
	public List<WidgetVO> getWidgetList(WidgetVO vo, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		return service.getWidgetList(vo);
	}

	@RequestMapping("widgetContent")
	public Map<String, Object> widgetContent(WidgetVO vo) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		return service.widgetContent(vo);
	}
}

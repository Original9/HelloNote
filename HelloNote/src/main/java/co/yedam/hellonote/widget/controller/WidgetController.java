package co.yedam.hellonote.widget.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.hellonote.widget.service.WidgetService;
import co.yedam.hellonote.widget.vo.WidgetVO;

@RestController
public class WidgetController {

	@Autowired
	WidgetService service;
	
	@RequestMapping("getWidgetList")
	public List<WidgetVO> getWidgetList(WidgetVO vo, HttpSession session){
		vo.setHellonoteId((String) session.getAttribute("hellonoteId"));
		return service.getWidgetList(vo); 
	}
	
}

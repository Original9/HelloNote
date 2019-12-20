package co.yedam.hellonote.checklist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.hellonote.checklist.service.CheckListService;
import co.yedam.hellonote.checklist.vo.CheckListVO;

@RestController
public class RestFulCheckListController {

	@Autowired CheckListService checkListService;
	
	@RequestMapping("getCheckList")
	public List<CheckListVO> getCheckList(HttpServletRequest request,Model model, CheckListVO vo){
		String menuId = request.getParameter("menuId");
		request.setAttribute("menuId", menuId);
		UserDetails userDetails =(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		return checkListService.getCheckList(vo);
	}
	
	@RequestMapping(value="/getCheckListT5",method=RequestMethod.GET)
	public List<CheckListVO> getCheckListT5(HttpServletRequest request,Model model, CheckListVO vo){
		String menuId = request.getParameter("menuId");
		request.setAttribute("menuId", menuId);
		UserDetails userDetails =(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		HttpSession session = request.getSession();
		vo.setHellonoteId(userDetails.getUsername());
		return checkListService.getCheckListT5(vo);
	}
	
	
	@RequestMapping(value="/insertList",method=RequestMethod.POST ,consumes ="application/json")
	public CheckListVO insertList(@RequestBody CheckListVO vo,HttpSession session ) {
//		String menuId = request.getParameter("menuId");
//		request.setAttribute("menuId", menuId);
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		checkListService.insertList(vo);
		return vo;
	}
	
	
	@RequestMapping(value="/updateChecklist",method=RequestMethod.PUT ,consumes ="application/json")
	public CheckListVO updateChecklist(@RequestBody CheckListVO vo,HttpSession session ) {
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		checkListService.updateList(vo);
		return vo;
	}
	
	@RequestMapping(value="/deleteChecklist",method=RequestMethod.DELETE ,consumes ="application/json")
	public CheckListVO deleteCheckList(@RequestBody CheckListVO vo,HttpSession session ) {
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		checkListService.deleteList(vo);
		return vo;
	}
	
	@RequestMapping("checkSortHandling")
	public void sortHandling(CheckListVO vo, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		
//		vo.
//		#{oldOrder} and #{checklistOrder}
		checkListService.checkSortHandling1(vo);
		checkListService.checkSortHandling2(vo);
	}
	
}

package co.yedam.hellonote.memo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.hellonote.memo.service.MemoService;
import co.yedam.hellonote.memo.vo.MemoVO;

@RestController
public class RestMemoController {

	@Autowired
	MemoService service;

	@RequestMapping(value = "insertMemo")
	public int insertMemo(MemoVO vo, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		
		int a = service.insertMemo(vo);
		return a;
	}

	@RequestMapping("memoSortHandling")
	public void sortHandling(MemoVO vo, HttpSession session) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
   

		service.sortHandling1(vo);
		service.sortHandling2(vo);
	}
	
	@RequestMapping("deleteHandling")
	public void deleteHandling(HttpSession session, MemoVO vo) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		
		service.deleteHandling(vo);
		service.deleteMemo(vo);
	}

	@RequestMapping("updateMemo")
	public void updateMemo(HttpSession session, MemoVO vo) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		
		service.updateMemo(vo);
	}
	
	@RequestMapping("widgetMemo")
	public MemoVO widgetMemo(MemoVO vo){
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setHellonoteId(userDetails.getUsername());
		
		return service.widgetMemo(vo);
	}
}

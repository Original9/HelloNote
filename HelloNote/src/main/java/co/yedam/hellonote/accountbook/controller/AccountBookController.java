package co.yedam.hellonote.accountbook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.hellonote.accountbook.service.AccountBookService;
import co.yedam.hellonote.accountbook.vo.AccountBookVO;

@Controller
public class AccountBookController {

	@Autowired
	AccountBookService accountBookService;
	
	
	@RequestMapping("/accountBook")
	public String accoutBookList() {
		
		return "main/menuList/accountBook";
	}
	
	
	//전체 조회
	@RequestMapping("/getAccountBookList.json")
	@ResponseBody
	public List<AccountBookVO>getAccountBookList(HttpSession session, AccountBookVO vo){
		
		vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
//		vo.setAccountbookSeq(session.getAttribute("accountBook"));
//		vo.setMenuId(request.getParameter("menuId"));
		return accountBookService.getAccountBookList(vo);	
	}
	
	
	//등록
	@RequestMapping(value="/insertAccountBook.json", consumes ="application/json" )
	@ResponseBody
	public AccountBookVO insertAccountBook(@RequestBody AccountBookVO vo, HttpSession session) {
		
		vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
		accountBookService.insertAccountBook(vo);
		return vo;
		
	}
	
	//삭제
	@RequestMapping("/deleteAccountBook.json")
	@ResponseBody
	public Map deleteAccountBook(AccountBookVO vo, Model model, HttpSession session) {
		vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
		accountBookService.deleteAccountBook(vo);		
		 Map result = new HashMap<Integer, Object>(); result.put("result",Boolean.TRUE); 
		 return result;
		 
	}
	//수정
	@RequestMapping(value="/updateAccountBook.json", consumes="application/json", method=RequestMethod.PUT)
	@ResponseBody
	public AccountBookVO updateAccountbook(@RequestBody AccountBookVO vo, Model model, HttpSession session) {
		vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
		accountBookService.updateAccountBook(vo);
		return vo;
	}

	
	
	
}

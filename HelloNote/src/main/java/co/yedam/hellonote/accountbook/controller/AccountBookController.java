package co.yedam.hellonote.accountbook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.hellonote.accountbook.service.AccountBookService;
import co.yedam.hellonote.accountbook.vo.AccountBookVO;

@Controller
public class AccountBookController {

	@Autowired
	AccountBookService accountBookService;
	
	
	@RequestMapping("/menuList/accountBook")
	public String accoutBookList() {
		
		return "main/menuList/accountBook";
	}
	
	
	//전체 조회
	@RequestMapping("/menuList/getAccountBookList.json")
	@ResponseBody
	public List<AccountBookVO>getAccountBookList(HttpSession session, AccountBookVO vo){
		
		vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
//		vo.setAccountbookSeq(session.getAttribute("accountBook"));
		
		return accountBookService.getAccountBookList(vo);	
	}
	
	
	//등록
	@RequestMapping(value="/menuList/insertAccountBook.json", consumes ="application/json" )
	@ResponseBody
	public AccountBookVO insertAccountBook(@RequestBody AccountBookVO vo, HttpSession session) {
		
		vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
		accountBookService.insertAccountBook(vo);
		return vo;
		
	}
	
	@RequestMapping(value="/menuList/deleteAccountBook.json", consumes ="application/json" )
	@ResponseBody
	public AccountBookVO deleteAccountbook(@RequestBody AccountBookVO vo, HttpSession session) {
		vo.setHellonoteId((String)session.getAttribute("hellonoteId"));
		accountBookService.deleteAccountBook(vo);
		System.out.println(vo.getAccountbookSeq());
		return vo;
	}

	
	
	
}

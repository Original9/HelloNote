package co.yedam.hellonote.accountbook.controller;

import java.util.List;

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
		
		return "/menuList/accountBook";
	}
	
	
	//전체 조회
	@RequestMapping("/menuList/getAccountBookList.json")
	@ResponseBody
	public List<AccountBookVO>getAccountBookList(AccountBookVO vo){
		
		return accountBookService.getAccountBookList(vo);	
	}
	
	
	//기간별 조회
	@RequestMapping("/menuList/searchAccountBook.json")
	@ResponseBody
	public List<AccountBookVO>searchAccountBook(AccountBookVO vo){
		
		return accountBookService.searchAccountBook(vo);
		
	}
	
	//항목 조회
	

	
	//등록
	@ResponseBody
	@RequestMapping(value="/insertAccountBook.json", consumes ="application/json" )
	public AccountBookVO insertAccountBook(@RequestBody AccountBookVO vo) {
		
		accountBookService.insertAccountBook(vo);
		return vo;
		
	}
	


	
	
	
}

package co.yedam.hellonote.hellonote.accountbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.hellonote.hellonote.accountbook.service.AccountBookService;
import co.yedam.hellonote.hellonote.accountbook.service.Paging;
import co.yedam.hellonote.hellonote.accountbook.vo.AccountBookSearchVO;
import co.yedam.hellonote.hellonote.accountbook.vo.AccountBookVO;

@RestController
public class AccountBookController {

	@Autowired
	AccountBookService accountBookService;
	
	//전체 조회
	@RequestMapping("ajax/getAccountBookList.json")
	@ResponseBody
	public List<AccountBookVO>getAccountBookList(AccountBookVO vo){
		
		return accountBookService.getAccountBookList(vo);	
	}
	
	@RequestMapping("accountBookList")
	public String accoutBookList() {
		
		return "menuList/accountBook";
	}
	
	
	//등록
	@RequestMapping(value="ajax/insertAccountBook.json", consumes ="application/json" )
	public int insertAccountBook(@RequestBody AccountBookVO vo) {
		
		return accountBookService.insertAccountBook(vo);
	}
	
	
	
}

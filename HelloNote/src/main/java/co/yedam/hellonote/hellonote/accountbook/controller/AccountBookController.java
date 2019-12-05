package co.yedam.hellonote.hellonote.accountbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.yedam.hellonote.hellonote.accountbook.service.AccountBookService;
import co.yedam.hellonote.hellonote.accountbook.vo.AccountBookVO;

@RestController
public class AccountBookController {

	@Autowired
	AccountBookService accountBookService;
	
	//전체 조회
	@RequestMapping("/menuList/ajax/getAccountBookList.json")
	@ResponseBody
	public List<AccountBookVO>getAccountBookList(AccountBookVO vo){
		
		return accountBookService.getAccountBookList(vo);	
	}
	
	
	//기간별 조회
	@RequestMapping("/menuList/ajax/searchAccountBook.json")
	@ResponseBody
	public List<AccountBookVO>searchAccountBook(AccountBookVO vo){
		
		return accountBookService.searchAccountBook(vo);
		
	}
	
	//항목 조회
	

	
	//등록
	@RequestMapping(value="/menuList/ajax/insertAccountBook.json", consumes ="application/json" )
	public AccountBookVO insertAccountBook(@RequestBody AccountBookVO vo) {
		
		accountBookService.insertAccountBook(vo);
		return vo;
		
	}
	
	
	
}

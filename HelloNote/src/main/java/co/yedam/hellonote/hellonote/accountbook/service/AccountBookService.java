package co.yedam.hellonote.hellonote.accountbook.service;

import java.util.List;

import co.yedam.hellonote.hellonote.accountbook.vo.AccountBookVO;

public interface AccountBookService {
	
	List<AccountBookVO>getAccountBookList(AccountBookVO vo);
	
	List<AccountBookVO>searchAccountBook(AccountBookVO vo);
	
	int insertAccountBook(AccountBookVO vo);
	
	int updateAccountBook(AccountBookVO vo);
	
	
	
}

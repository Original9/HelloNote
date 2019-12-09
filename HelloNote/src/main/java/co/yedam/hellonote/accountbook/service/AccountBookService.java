package co.yedam.hellonote.accountbook.service;

import java.util.List;

import co.yedam.hellonote.accountbook.vo.AccountBookVO;

public interface AccountBookService {
	
	List<AccountBookVO>getAccountBookList(AccountBookVO vo);
	
	int deleteAccountBook(AccountBookVO vo);
	
	int insertAccountBook(AccountBookVO vo);
	
	int updateAccountBook(AccountBookVO vo);
	
	
	
}

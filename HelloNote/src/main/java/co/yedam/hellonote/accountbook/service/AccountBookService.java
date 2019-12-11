package co.yedam.hellonote.accountbook.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.yedam.hellonote.accountbook.vo.AccountBookVO;

@Service
public interface AccountBookService {
	
	List<AccountBookVO>getAccountBookList(AccountBookVO vo);
	
	int deleteAccountBook(AccountBookVO vo);
	
	int insertAccountBook(AccountBookVO vo);
	
	int updateAccountBook(AccountBookVO vo);
	
	
	
}

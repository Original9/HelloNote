package co.yedam.hellonote.accountbook.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import co.yedam.hellonote.accountbook.vo.AccountBookVO;

@Service
public interface AccountBookService {
	
	
	// 내역 전체 조회
	List<AccountBookVO>getAccountBookList(AccountBookVO vo);
	
	// 삭제
	int deleteAccountBook(AccountBookVO vo);
	
	// 등록
	int insertAccountBook(AccountBookVO vo);
	
	// 수정
	int updateAccountBook(AccountBookVO vo);
	
	// 구글 차트
	List<AccountBookVO>chartAccountBook(AccountBookVO vo);
	
}

package co.yedam.hellonote.hellonote.accountbook.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.hellonote.accountbook.dao.AccountBookDAO;
import co.yedam.hellonote.hellonote.accountbook.service.AccountBookService;
import co.yedam.hellonote.hellonote.accountbook.service.Paging;
import co.yedam.hellonote.hellonote.accountbook.vo.AccountBookSearchVO;
import co.yedam.hellonote.hellonote.accountbook.vo.AccountBookVO;
@Service
public class AccountBookServiceImpl implements AccountBookService {
	
	@Autowired
	AccountBookDAO dao;

	@Override
	public List<AccountBookVO> getAccountBookList(AccountBookVO vo) {

		return dao.getAccountBookList(vo);
	}

	@Override
	public int insertAccountBook(AccountBookVO vo) {
		return dao.insertAccountBook(vo);
	}

	@Override
	public int updateAccountBook(AccountBookVO vo) {
		return 0;
	}

	@Override
	public List<AccountBookVO> searchAccountBook(AccountBookVO vo) {
		return dao.searchAccountBook(vo);
	}

}

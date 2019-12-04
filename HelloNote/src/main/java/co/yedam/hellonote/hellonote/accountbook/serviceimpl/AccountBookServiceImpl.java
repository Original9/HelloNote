package co.yedam.hellonote.hellonote.accountbook.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.hellonote.accountbook.dao.AccountBookDAO;
import co.yedam.hellonote.hellonote.accountbook.service.AccountBookService;
import co.yedam.hellonote.hellonote.accountbook.vo.AccountBookVO;
@Service
public class AccountBookServiceImpl implements AccountBookService {
	
	@Autowired
	AccountBookDAO dao;

	@Override
	public List<AccountBookVO> getAccountBookList(AccountBookVO vo) {
//		//출력건수
//		p.setPageUnit(3);
//		// 페이지번호 파라미터
//		if( p.getPage() == null) {
//			p.setPage(1); 
//		}		
//		// 시작/마지막 레코드 번호
//		svo.setStart(p.getFirst());
//		svo.setEnd(p.getLast());		
//		// 전체 건수
//		//p.setTotalRecord(dao.getBoardCount(svo));
//		
		return dao.getAccountBookList(vo);
	}

	@Override
	public int insertAccountBook(AccountBookVO vo) {
		return 0;
	}

	@Override
	public int updateAccountBook(AccountBookVO vo) {
		return 0;
	}

}

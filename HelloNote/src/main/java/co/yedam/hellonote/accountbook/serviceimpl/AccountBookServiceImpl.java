package co.yedam.hellonote.accountbook.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.accountbook.dao.AccountBookDAO;
import co.yedam.hellonote.accountbook.service.AccountBookService;
import co.yedam.hellonote.accountbook.vo.AccountBookVO;

/**
 * 
 * 
 * @author User
 * @AccountBooks management class
 *
 */



@Service
public class AccountBookServiceImpl implements AccountBookService {
	
	@Autowired
	AccountBookDAO dao;

	
	
	/**
	 *  DB class
	 */
	
	/**
	 *  select list
	 *  @return List
	 *  @param AccountBook VO
	 *  
	 *  
	 */
	
	@Override
	public List<AccountBookVO> getAccountBookList(AccountBookVO vo) {

		return dao.getAccountBookList(vo);
	}
	
	//등록
	@Override
	public int insertAccountBook(AccountBookVO vo) {
		return dao.insertAccountBook(vo);
	}

	//삭제
	@Override
	public int deleteAccountBook(AccountBookVO vo) {
		return dao.deleteAccountBook(vo);
	}

	//수정
	@Override
	public int updateAccountBook(AccountBookVO vo) {
		return dao.updateAccountBook(vo);
	}

	//구글 차트
	@Override
	public List<AccountBookVO>chartAccountBook(AccountBookVO vo){
		return dao.chartAccountBook(vo);
		
	}
	
	//지출 차트
	@Override
	public List<AccountBookVO> nagetiveChartAccountBook(AccountBookVO vo) {
		return dao.nagetiveChartAccountBook(vo);
	}


}

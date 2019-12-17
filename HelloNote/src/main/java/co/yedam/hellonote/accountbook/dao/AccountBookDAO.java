package co.yedam.hellonote.accountbook.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.accountbook.vo.AccountBookVO;

@Repository
public class AccountBookDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
		
	//가계부 전체 리스트 조회 및 특정 기간/항목 설정 조회
	public List<AccountBookVO>getAccountBookList(AccountBookVO vo){
		
		return mybatis.selectList("AccountBookDAO.getAccountBookList", vo);
		
	}
	
	//가계부 등록
	public int insertAccountBook(AccountBookVO vo) {
		return mybatis.insert("AccountBookDAO.insertAccountBook", vo);
	}
	
	public int deleteAccountBook(AccountBookVO vo) {
		return mybatis.delete("AccountBookDAO.deleteAccountBook", vo);
	}
	
	//조회
	public int updateAccountBook(AccountBookVO vo) {
		return mybatis.update("AccountBookDAO.updateAccountBook", vo);
	}

	//구글 차트
	public List<AccountBookVO>chartAccountBook(AccountBookVO vo){
		return mybatis.selectList("AccountBookDAO.chartAccountBook", vo);
	}
	
}

package co.yedam.hellonote.hellonote.accountbook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.hellonote.accountbook.service.Paging;
import co.yedam.hellonote.hellonote.accountbook.vo.AccountBookSearchVO;
import co.yedam.hellonote.hellonote.accountbook.vo.AccountBookVO;

@Repository
public class AccountBookDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<AccountBookVO>getAccountBookList(AccountBookVO vo){
		
		return mybatis.selectList("AccountBookDAO.getAccountBookList", vo);
		
	}
	
	public List<AccountBookVO>searchAccountBook(AccountBookVO vo){
		return mybatis.selectList("AccountBookDAO.searchAccountBook", vo);
	}
	
	
	public int insertAccountBook(AccountBookVO vo) {
		return mybatis.insert("AccountBookDAO.insertAccountBook", vo);
	}
	

	
	
}

package co.yedam.hellonote.bankaccount.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.bankaccount.vo.BankAccountSearchVO;
import co.yedam.hellonote.bankaccount.vo.BankAccountVO;

@Repository
public class BankAccountDAO {

	@Autowired
	SqlSessionTemplate bankAccount;

	public int insertBankAccount(BankAccountVO vo) {
		return bankAccount.insert("BankAccountDAO.insertBankAccount",vo);
	};
	
	
	public int noInsertBankAccount(BankAccountVO vo) {
		return bankAccount.insert("BankAccountDAO.noInsertBankAccount", vo);
		
	}

	public int updateBankAccount(BankAccountVO vo) {
		return bankAccount.update("BankAccountDAO.updateBankAccount",vo);
	};

	public int deleteBankAccount(BankAccountVO vo) {
		return bankAccount.delete("BankAccountDAO.deleteBankAccount",vo);
	};
	
	public BankAccountVO selectBankAccount(BankAccountVO vo) {
		return bankAccount.selectOne("BankAccountDAO.selectBankAccount", vo);
		
	}
	
	 
//
//	List<BankAccountVO> getAllBankList(BankAccountSearchVO svo) {
//		return bankAccount.selectList("BankAccountDAO.getAllBankList",svo);
//	};
//
//	List<BankAccountVO> getMyBankList(BankAccountSearchVO svo) {
//		return bankAccount.selectList("BankAccountDAO.getMyBankList",svo);
//	};
//
//	List<BankAccountVO> getOtherBankList(BankAccountSearchVO svo) {
//		return bankAccount.selectList("BankAccountDAO.getOtherBankList",svo);
//	};
}

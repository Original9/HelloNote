package co.yedam.hellonote.bankaccount.service;

import org.springframework.stereotype.Repository;

//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;

import co.yedam.hellonote.bankaccount.vo.BankAccountVO;
//import co.yedam.hellonote.bankaccount.vo.BankValue;


public interface BankAccountService {
	
	
	int insertBankAccount(BankAccountVO vo);
	
	int updateBankAccount(BankAccountVO vo);
	
	int deleteBankAccount(BankAccountVO vo); 
	
//	List<BankAccountVO> getAllBankList();
//	
//	List<BankAccountVO> getMyBankList();
//	
//	List<BankAccountVO> getOtherBankList();
		
//	int getBankSumPrice(BankAccountVO vo);
//	
//	Map<Integer, BankValue> getBankTotalPrice(BankAccountVO vo);
	
}

package co.yedam.hellonote.bankaccount.service;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;

import co.yedam.hellonote.bankaccount.vo.BankAccountVO;
//import co.yedam.hellonote.bankaccount.vo.BankValue;

@Service
public interface BankAccountService {
	
	
	int insertBankAccount(BankAccountVO vo);
	
	int noInsertBankAccount(BankAccountVO vo);
	
	int updateBankAccount(BankAccountVO vo);
	
	int deleteBankAccount(BankAccountVO vo); 
	
	BankAccountVO selectBankAccount(BankAccountVO vo);
	
//	List<BankAccountVO> getAllBankList();
//	
//	List<BankAccountVO> getMyBankList();
//	
//	List<BankAccountVO> getOtherBankList();
		
//	int getBankSumPrice(BankAccountVO vo);
//	
//	Map<Integer, BankValue> getBankTotalPrice(BankAccountVO vo);
	
}

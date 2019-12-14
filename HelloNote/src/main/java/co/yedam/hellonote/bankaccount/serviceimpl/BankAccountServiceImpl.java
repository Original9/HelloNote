package co.yedam.hellonote.bankaccount.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.bankaccount.dao.BankAccountDAO;
import co.yedam.hellonote.bankaccount.service.BankAccountService;
import co.yedam.hellonote.bankaccount.vo.BankAccountVO;
//import co.yedam.hellonote.bankaccount.vo.BankValue;

@Service
public class BankAccountServiceImpl implements BankAccountService{

	@Autowired
	BankAccountDAO bankAccountDAO;
	
	@Override
	public int insertBankAccount(BankAccountVO vo) {
		
		return 0;
	}

	@Override
	public int updateBankAccount(BankAccountVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBankAccount(BankAccountVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

//	@Override
//	public List<BankAccountVO> getAllBankList() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<BankAccountVO> getMyBankList() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<BankAccountVO> getOtherBankList() {
//		// TODO Auto-generated method stub
//		return null;
//	}

//	@Override
//	public int getBankSumPrice(BankAccountVO vo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public Map<Integer, BankValue> getBankTotalPrice(BankAccountVO vo) {
//		// TODO Auto-generated method stub
//		return null;
//	}


}

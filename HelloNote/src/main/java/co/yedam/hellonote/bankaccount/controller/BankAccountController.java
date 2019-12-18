package co.yedam.hellonote.bankaccount.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.hellonote.bankaccount.service.BankAccountService;
import co.yedam.hellonote.bankaccount.vo.BankAccountVO;

@Controller
public class BankAccountController {
//
	@Autowired
	BankAccountService bankAccountService;
	
	@RequestMapping("/menuList/bankaccount")
	public String getBankAccount() {
		
		return "main/menuList/bankaccount";
	}
	
	//단건 조회
	@ResponseBody
	@RequestMapping("/selectBankAccount")
	public BankAccountVO selectBankAccount(BankAccountVO vo,HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		userDetails.getUsername();
		return bankAccountService.selectBankAccount(vo);
	}
	
	//등록
	
	
	
	
}

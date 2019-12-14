package co.yedam.hellonote.bankaccount.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.hellonote.bankaccount.service.BankAccountService;

@Controller
public class BankAccountController {
//
	@Autowired
	BankAccountService bankAccountService;
	
	@RequestMapping("/menuList/bankaccount")
	public String getBankAccount() {
		
		return "main/menuList/bankaccount";
	}
}

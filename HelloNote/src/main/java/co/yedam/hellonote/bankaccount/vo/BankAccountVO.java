package co.yedam.hellonote.bankaccount.vo;

import lombok.Data;

@Data
public class BankAccountVO {
	
	int bankAccountSeq; 
	String menuId;
	String bankAccountBankName; //계좌이름(사용자정의 가능)
	String bankAccountOwner; //계좌주(사용자정의가능)
	String bankaccountAccountnumber; //계좌번호(변경불가)
//	int bankIndex; //(정렬순서)
	int bankCode; //은행테이블-은행코드(은행이름 가져오기)
	String bankaccountPintechConn; //계좌인증아이디.
//	String ismine; //T or F 내꺼냐 아니냐 옵션.
	
}

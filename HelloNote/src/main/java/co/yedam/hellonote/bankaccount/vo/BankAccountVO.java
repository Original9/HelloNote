package co.yedam.hellonote.bankaccount.vo;

public class BankAccountVO {
	String menu_Id;
	String bankaccount_Accountname; //계좌이름(사용자정의 가능)
	String bankaccount_Defineowner; //계좌주(사용자정의가능)
	String bankaccount_Accountnumber; //계좌번호(변경불가)
	int bank_Index; //(정렬순서)
	int bank_Code; //은행테이블-은행코드(은행이름 가져오기)
	String bankaccount_pintech_conn; //계좌인증아이디.
	String ismine; //T or F 내꺼냐 아니냐 옵션.
	
}

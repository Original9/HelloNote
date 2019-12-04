package co.yedam.hellonote.hellonote.accountbook.vo;

import lombok.Data;

@Data
public class AccountBookVO {
	
	String menuId; //메뉴 아이디
	int accountSeq; //시퀀스
	int balance; //잔고
	String date; //날짜
	String accountbookTranslation; //비고
	int accountbookPrice; //금액
	String purpose; // 이용목적(셀렉트 박스 항목 표시)
	int inout; // 수입 및 지출 구분

	
	

}

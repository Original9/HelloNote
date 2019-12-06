package co.yedam.hellonote.accountbook.vo;


import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AccountBookVO {
	
	String accountbookMenuid; //메뉴 아이디
	int accountbookSeq; //시퀀스
	int accountbookBalance; //잔고
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private String accountbookDate; //날짜
	String accountbookTranslation; //비고
	int accountbookPrice; //금액
	String accountbookPurpose; // 이용목적(셀렉트 박스 항목 표시)
	int accountbookInout; // 수입 및 지출 구분
	String accountbookFirstDate; //기간조회 첫 번째로 선택하는 날짜
	String accountbookLastDate; //기간조회  두 번째로 선택하는 날짜
	
	
	

}

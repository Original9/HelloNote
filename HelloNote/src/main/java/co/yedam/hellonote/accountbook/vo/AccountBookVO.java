package co.yedam.hellonote.accountbook.vo;



import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AccountBookVO {
	
	private String accountbookMenuid; //메뉴 아이디
	private int accountbookSeq; //시퀀스
	private int accountbookBalance; //잔고
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm")
	private String accountbookDate; //날짜
	private String accountbookTranslation; //비고
	private int accountbookPrice; //금액
	private String accountbookPurpose; // 이용목적(셀렉트 박스 항목 표시)
	private int accountbookInout; // 수입 및 지출 구분
	private String accountbookFirstDate; //기간조회 첫 번째로 선택하는 날짜
	private String accountbookLastDate; //기간조회  두 번째로 선택하는 날짜
	private String hellonoteId;
	private int accountbookPercent;
	private String menuId;
	
	

}

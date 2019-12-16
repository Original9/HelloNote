package co.yedam.hellonote.accountbook.vo;

import lombok.Data;

@Data
public class AccountBookSearchVO {
	
	private String keyword;

	public String searchCondition;
	
	private int start;
	private int end;
}

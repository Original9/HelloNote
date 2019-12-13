package co.yedam.hellonote.mysite.vo;

import lombok.Data;

@Data
public class MySiteSearchVO extends MySiteVO {

	private String keyword;
	private String searchCondition;
	private int start;
	private int end;
	private int menuId;

}

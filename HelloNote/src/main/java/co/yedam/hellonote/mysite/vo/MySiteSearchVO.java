package co.yedam.hellonote.mysite.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
// 검색 기능 vo
@Data
@EqualsAndHashCode(callSuper=false)
public class MySiteSearchVO extends MySiteVO {

	private String keyword;
	private String searchCondition;
	private int start;
	private int end;
	private int menuId;

}

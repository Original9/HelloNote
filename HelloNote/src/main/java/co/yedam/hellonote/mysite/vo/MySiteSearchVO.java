package co.yedam.hellonote.mysite.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MySiteSearchVO extends MySiteVO {

	private String keyword;
	private String searchCondition;
	private int start;
	private int end;
	private int menuId;

}

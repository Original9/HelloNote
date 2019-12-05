package co.yedam.hellonote.memo.vo;

import lombok.Data;

@Data
public class MemoVO {

	private String memoTitle;
	private String memoText;
	private String menuId;
	private int memoSeq;
	private String memoPlace;
	private int memoOrder;
	private String hellonoteId;
	private int oldOrder;
}

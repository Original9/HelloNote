package co.yedam.hellonote.mysite.vo;

import java.sql.Date;

import lombok.Data;

// 값 넣을 vo
@Data
public class MySiteVO {
	
	private String userId;
	private String siteId;
	private String sitePw;
	private String siteAddr;
	private String siteMemo;
	private String title;
	private int menuId;
	private int mySiteSeq;
	private Date siteDate;
	
}

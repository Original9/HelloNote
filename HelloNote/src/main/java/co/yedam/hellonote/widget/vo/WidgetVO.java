package co.yedam.hellonote.widget.vo;

import lombok.Data;

@Data
public class WidgetVO {
	
	private int widgetsSeq;
	private String xLocation;
	private String yLocation;
	private int menuId;
	private int zIndex;
	private int menuTypeNumber;
	private String hellonoteId;
	private int checklistSeq;
	private String checklistStatus;
}

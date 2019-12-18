package co.yedam.hellonote.checklist.vo;

import lombok.Data;

@Data
public class CheckListVO {
	String checklistMission;
	String checklistStatus;
	String menuId;
	int checklistSeq;
	int checklistOrder; //정렬을 위한 임의의 변수
	int oldOrder;
	String hellonoteId; //유저의 테이블을 검색하기위한 임의의 변수
//왜안수정요.?
}

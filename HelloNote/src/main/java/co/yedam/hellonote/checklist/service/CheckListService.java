package co.yedam.hellonote.checklist.service;

import java.util.List;

import co.yedam.hellonote.checklist.vo.CheckListVO;

public interface CheckListService {
	public List<CheckListVO> getCheckList(CheckListVO vo);
	public int deleteList(CheckListVO vo);
	public int insertList(CheckListVO vo);
	public int updateList(CheckListVO vo);

}

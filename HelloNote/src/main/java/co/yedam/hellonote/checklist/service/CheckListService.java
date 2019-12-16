package co.yedam.hellonote.checklist.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.yedam.hellonote.checklist.vo.CheckListVO;

@Service
public interface CheckListService {
	public List<CheckListVO> getCheckList(CheckListVO vo);
	public List<CheckListVO> getCheckListT5(CheckListVO vo); //weiget 용
	public int deleteList(CheckListVO vo);
	public int insertList(CheckListVO vo);
	public int updateList(CheckListVO vo);

}

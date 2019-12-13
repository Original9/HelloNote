package co.yedam.hellonote.memo.service;

import java.util.List;

import co.yedam.hellonote.memo.vo.MemoVO;

public interface MemoService {

	public List<MemoVO> getMemoList(MemoVO vo);

	public int insertMemo(MemoVO vo);

	public void updateMemo(MemoVO vo);

	public void deleteMemo(MemoVO vo);

	public void sortHandling1(MemoVO vo);
	
	public void sortHandling2(MemoVO vo);

	public void deleteHandling(MemoVO vo);
	
	public MemoVO widgetMemo(MemoVO vo);
}
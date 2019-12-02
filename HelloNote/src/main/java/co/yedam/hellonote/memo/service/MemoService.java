package co.yedam.hellonote.memo.service;

import java.util.List;

import co.yedam.hellonote.memo.vo.MemoVO;

public interface MemoService {

	public List<MemoVO> getMemoList();

	public void insertMemo();

	public void updateMemo(MemoVO vo);

	public void deleteMemo(MemoVO vo);

}
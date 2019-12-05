package co.yedam.hellonote.memo.service;

import java.util.List;

import co.yedam.hellonote.memo.vo.MemoVO;
import co.yedam.hellonote.user.vo.UserVO;

public interface MemoService {

	public List<MemoVO> getMemoList(MemoVO vo);

	public int insertMemo(MemoVO vo);

	public void updateMemo(MemoVO vo);

	public void deleteMemo(MemoVO vo);

}
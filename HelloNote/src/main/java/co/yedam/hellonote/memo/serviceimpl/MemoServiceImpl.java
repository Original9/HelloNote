package co.yedam.hellonote.memo.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.hellonote.memo.dao.MemoDAO;
import co.yedam.hellonote.memo.service.MemoService;
import co.yedam.hellonote.memo.vo.MemoVO;

@Service
public class MemoServiceImpl implements MemoService {

	@Autowired
	private MemoDAO dao;

	public List<MemoVO> getMemoList(MemoVO vo) {
		return dao.getMemoList(vo);
	}

	public int insertMemo(MemoVO vo) {
		return dao.insertMemo(vo);
	}

	public void updateMemo(MemoVO vo) {
		dao.updateMemo(vo);
	}

	public void deleteMemo(MemoVO vo) {
		dao.deleteMemo(vo);
	}

	public void sortHandling1(MemoVO vo) {
		dao.sortHandling1(vo);
	}

	public void sortHandling2(MemoVO vo) {
		dao.sortHandling2(vo);
	}

	@Override
	public void deleteHandling(MemoVO vo) {
		dao.deleteHandling(vo);
	}

}

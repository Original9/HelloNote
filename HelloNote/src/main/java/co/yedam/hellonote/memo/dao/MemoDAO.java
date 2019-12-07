package co.yedam.hellonote.memo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.memo.vo.MemoVO;

@Repository
public class MemoDAO {

	@Autowired
	SqlSessionTemplate batis;

	public List<MemoVO> getMemoList(MemoVO vo) {
		return batis.selectList("MemoDAO.getMemoList", vo);
	}

	public int insertMemo(MemoVO vo) {
		batis.insert("MemoDAO.insertMemo", vo);
		return vo.getMemoSeq();
	}

	public void updateMemo(MemoVO vo) {
		batis.update("MemoDAO.updateMemo", vo);
	}

	public void deleteMemo(MemoVO vo) {
		batis.delete("MemoDAO.deleteMemo", vo);
	}

	public void sortHandling1(MemoVO vo) {
		batis.update("MemoDAO.sortHandling1", vo);
	}

	public void sortHandling2(MemoVO vo) {
		batis.update("MemoDAO.sortHandling2", vo);
	}
	
	public void deleteHandling(MemoVO vo) {
		batis.update("MemoDAO.deleteHandling", vo);
	}
}

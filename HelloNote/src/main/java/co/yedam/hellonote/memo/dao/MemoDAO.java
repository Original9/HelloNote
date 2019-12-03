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
	
	public List<MemoVO> getMemoList(){
		return batis.selectList("MemoDAO.getMemoList");
	}
	
	public void insertMemo() {
		MemoVO vo=new MemoVO();
		batis.insert("MemoDAO.insertMemo", vo);
	}
	
	public void updateMemo(MemoVO vo) {
		batis.update("MemoDAO.updateMemo", vo);
	}
	
	public void deleteMemo(MemoVO vo) {
		batis.delete("MemoDAO.deleteMemo", vo);
	}
}

package co.yedam.hellonote.memo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.memo.vo.MemoVO;
import co.yedam.hellonote.user.vo.UserVO;

@Repository
public class MemoDAO {
	
	@Autowired
	SqlSessionTemplate batis;
	
	public List<MemoVO> getMemoList(UserVO uservo){
		return batis.selectList("MemoDAO.getMemoList", uservo);
	}
	
	public int insertMemo(MemoVO memovo) {
		batis.insert("MemoDAO.insertMemo", memovo);
		return memovo.getMemoSeq(); 
	}
	
	public void updateMemo(MemoVO vo) {
		batis.update("MemoDAO.updateMemo", vo);
	}
	
	public void deleteMemo(MemoVO vo) {
		batis.delete("MemoDAO.deleteMemo", vo);
	}
}

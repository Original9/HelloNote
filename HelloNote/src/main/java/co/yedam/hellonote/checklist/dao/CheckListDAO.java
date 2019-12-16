package co.yedam.hellonote.checklist.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.checklist.vo.CheckListVO;

@Repository
public class CheckListDAO {

	@Autowired
	SqlSessionTemplate sqltem;
	
	public List<CheckListVO> getCheckList(CheckListVO vo) {
		vo.setHellonoteId(vo.getHellonoteId().toUpperCase());
		return sqltem.selectList("CheckListDAO.getCheckList", vo);
	}

	public int deleteList(CheckListVO vo) {
		return sqltem.delete("CheckListDAO.deleteList", vo);
	}

	public int insertList(CheckListVO vo) {
		
		return sqltem.insert("CheckListDAO.insertList", vo);
	}

	public int updateList(CheckListVO vo) {
		System.out.println("dao");
		return sqltem.update("CheckListDAO.updateList", vo);
	}
	
	public List<CheckListVO> getCheckListT5(CheckListVO vo){
		vo.setHellonoteId(vo.getHellonoteId().toUpperCase());
		return sqltem.selectList("CheckListDAO.getCheckListT5", vo);
		
	}
}

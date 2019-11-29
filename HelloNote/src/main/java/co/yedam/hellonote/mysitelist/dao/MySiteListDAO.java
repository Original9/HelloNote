package co.yedam.hellonote.mysitelist.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.mysitelist.vo.MySiteListVO;

@Repository
public class MySiteListDAO {

	@Autowired
	SqlSessionTemplate mySiteList;

	// 전체 조회
	public List<MySiteListVO> getMySiteList() {
		return mySiteList.selectList("MySiteListDAO.getMySiteList");
	}

	// 삭제
	public int deleteMySiteList(MySiteListVO vo) {
		return mySiteList.delete("MySiteListDAO.deleteMySiteList", vo);
	}

	// 등록
	public int insertMySiteList(MySiteListVO vo) {
		return mySiteList.insert("MySiteListDAO.insertMySiteList", vo);
	}

	// 수정
	public int updateMySiteList(MySiteListVO vo) {
		return mySiteList.update("MySiteListDAO.updateMySiteList", vo);
	}

	// 단건조회
	public MySiteListVO getMySiteList(MySiteListVO vo) {
		return mySiteList.selectOne("MySiteListDAO.getMySiteList", vo);
	}

}

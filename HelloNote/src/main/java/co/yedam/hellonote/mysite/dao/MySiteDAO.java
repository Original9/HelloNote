package co.yedam.hellonote.mysite.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.hellonote.mysite.vo.MySiteSearchVO;
import co.yedam.hellonote.mysite.vo.MySiteVO;

@Repository
public class MySiteDAO {

	@Autowired
	SqlSessionTemplate mySite;

	// 전체 조회
	public List<MySiteVO> getMySiteList(MySiteSearchVO svo) {
		return mySite.selectList("MySiteDAO.getMySiteList", svo);
	}
	
	// 건수조회
	public int getMySiteCount(MySiteSearchVO svo) {
		return mySite.selectOne("MySiteDAO.getMySiteCount", svo);
	}
	// 삭제
	public int deleteMySite(MySiteVO vo) {
		return mySite.delete("MySiteDAO.deleteMySite", vo);
	}

	// 등록
	public int insertMySite(MySiteVO vo) {
		return mySite.insert("MySiteDAO.insertMySite", vo);
	}

	// 수정
	public int updateMySite(MySiteVO vo) {
		return mySite.update("MySiteDAO.updateMySite", vo);
	}

	// 단건조회
	public MySiteVO getMySite(MySiteVO vo) {
		return mySite.selectOne("MySiteDAO.getMySite", vo);
	}

}

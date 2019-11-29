package co.yedam.hellonote.mysitelist.service;

import java.util.List;

import co.yedam.hellonote.mysitelist.vo.MySiteListVO;

public interface MySiteListService {

	// 전체 조회
	List<MySiteListVO> getMySiteList();
	
	// 삭제
	int deleteMySiteList(MySiteListVO vo);
	
	// 등록
	int insertMySiteList(MySiteListVO vo);
	
	// 수정
	int updateMySiteList(MySiteListVO vo);
	
	// 단건조회
	MySiteListVO getMySiteList(MySiteListVO vo);
	
}

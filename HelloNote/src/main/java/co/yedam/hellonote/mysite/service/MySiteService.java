package co.yedam.hellonote.mysite.service;

import java.util.List;


import co.yedam.hellonote.mysite.vo.MySiteVO;

public interface MySiteService {

	// 전체 조회
	List<MySiteVO> getMySiteList(MySiteVO vo);

	// 삭제
	int deleteMySite(MySiteVO vo);

	// 등록
	int insertMySite(MySiteVO vo);

	// 수정
	int updateMySite(MySiteVO vo);

	// 단건조회
	MySiteVO getMySite(MySiteVO vo);

}

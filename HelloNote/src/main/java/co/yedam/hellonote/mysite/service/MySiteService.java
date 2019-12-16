package co.yedam.hellonote.mysite.service;

import java.util.List;
import java.util.Map;

import co.yedam.hellonote.mysite.paging.Paging;
import co.yedam.hellonote.mysite.vo.MySiteSearchVO;
import co.yedam.hellonote.mysite.vo.MySiteVO;

public interface MySiteService {
	
	// 전체조회<Map>
	List<Map<String, Object>> getMySiteListMap(MySiteVO vo);

	// 전체 조회
	List<MySiteVO> getMySiteList(MySiteSearchVO svo, Paging p);

	// 삭제
	int deleteMySite(int[] list, MySiteVO vo);

	// 등록
	int insertMySite(MySiteVO vo);

	// 수정
	int updateMySite(MySiteVO vo);

	// 단건조회
	MySiteVO getMySite(MySiteVO vo);
	
	// 단건삭제
	int getMySitedelete(MySiteVO vo);


}
